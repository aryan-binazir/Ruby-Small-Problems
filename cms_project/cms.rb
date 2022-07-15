require "sinatra"
require "sinatra/reloader"
require "sinatra/content_for"
require "tilt/erubis"
require "redcarpet"
require "yaml"
require "bcrypt"

configure do
  enable :sessions
  set :session_secret, 'FSgaERGrgaWEGRAgeaghaedgh43g5qwbg5#Q$#Q#$T3qgqwegbrfbA' #ENV['SESSION_SECRET']
  set :erb, :escape_html => true
end

def load_user_credentials
  credentials_path = if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/users.yml", __FILE__)
  else
    File.expand_path("../users.yml", __FILE__)
  end
  YAML.load_file(credentials_path)
end

def valid_credentials?(username, password)
  credentials = load_user_credentials

  if credentials.key?(username)
    bcrypt_password = BCrypt::Password.new(credentials[username])
    bcrypt_password == password
  else
    false
  end
end

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def load_content(path)
  content = File.read(path)

  case File.extname(path)
  when '.txt'
    headers["Content-Type"] = "text/plain"
    content
  when '.md'
    erb render_markdown(content), layout: :layout
  end
end

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

def signed_in?
  session.key?(:username)
end

def require_signed_in_user
  unless signed_in?
    session[:message] = "You must be signed in to do that."
    redirect "/"
  end
end

# Show home page
get '/' do
  pattern = File.join(data_path, "*")
  @files = Dir.glob(pattern).map do |path|
    File.basename(path)
  end
  
  erb :home, layout: :layout
end

# Read text file from `/data/*`
get '/:filename' do
  file_path = File.join(data_path, params[:filename])
  
  if File.file?(file_path)
    load_content(file_path)
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect '/'
  end
end

get "/:filename/edit" do
  require_signed_in_user

  file_path = File.join(data_path, params[:filename])

  @filename = params[:filename]
  @content = File.read(file_path)

  erb :edit_page, layout: :layout
end

post '/:filename' do
  require_signed_in_user

  file_path = File.join(data_path, params[:filename])

  File.write(file_path, params[:content])

  session[:message] = "#{params[:filename]} has been updated."
  redirect "/"
end

# send to new/document page to create document
get '/new/document' do
  require_signed_in_user

  erb :new_document, layout: :layout
end

# create new document
post '/new/document' do
  require_signed_in_user

  filename = params[:filename]
  file_path = File.join(data_path, filename)

  if filename.size == 0
    session[:message] = "A name is required."
    status 422
    erb :new_document, layout: :layout
  else

    File.write(file_path, "")
    session[:message] = "#{filename} was created"

    redirect '/'
  end
end

# delete a document
post '/:filename/delete' do
  require_signed_in_user

  filename = params[:filename]
  file_path = File.join(data_path, filename)

  File.delete(file_path)

  session[:message] = "#{params[:filename]} has been deleted."
  redirect '/'
end

# Go to user signin page
get '/users/signin_page' do
  erb :sign_in, layout: :layout
end

post '/users/signin' do
  username = params[:username]
  
  if valid_credentials?(username, params[:password])
    session[:username] = "admin"
    session[:message] = "Welcome! Log in successful."
    redirect '/'
  else
    session[:message] = "Invalid username or password"
    status 422
    erb :sign_in, layout: :layout
  end
end

# go to user signout
post '/users/signout' do
  session.delete(:username)
  session[:message] = "You have been signed out."
  redirect '/'
end