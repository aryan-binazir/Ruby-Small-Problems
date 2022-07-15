require 'yaml'
Psych == YAML

require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

before do
  @users = Psych.load_file("users.yaml")
end

helpers do
  def count_interests
    count = 0

    @users.each do |user|
      interests = user[1][:interests]

      interests.each { |_| count += 1}
    end
    count
  end

  def count_users
    @users.keys.count
  end
end

get "/" do
  erb :home
end

get "/user/:name" do
  @name = params[:name].to_sym
  @interests = @users[@name][:interests]
  @email = @users[@name][:email]

  erb :user
end