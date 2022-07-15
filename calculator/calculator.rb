require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(number)
  integer?(number) || float?(number)
end

def integer?(number)
  number.to_i.to_s == number
end

def float?(number)
  number.to_f.to_s == number
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt(messages('welcome'))
name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt(messages('valid_name'))
  else
    break
  end
end

loop do
  number1 = nil
  number2 = nil

  prompt("Hi #{name}!")

  loop do
    prompt(messages('first_number'))
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt(messages('not_right'))
    end
  end

  loop do
    prompt(messages('second_number'))
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt(messages('not_right'))
    end
  end

  operator_prompt = <<-MSG
    What operations would you like to perform?
    1) add 
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('must_include'))
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers")

  result =
    case operator
    when '1'
      number1.to_i + number2.to_i
    when '2'
      number1.to_i - number2.to_i
    when '3'
      number1.to_i * number2.to_i
    when '4'
      number1.to_f / number2.to_f
    end

  prompt("The result is #{result}")

  prompt(messages('calculate_again'))
  answer = gets.chomp
  break unless answer.downcase == 'y'
end

prompt(messages('end'))
