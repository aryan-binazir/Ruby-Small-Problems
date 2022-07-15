require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')

def messages(message)
  puts(MESSAGES[message])
end

def float?(number)
  number.to_f.to_s == number
end

def integer?(number)
  number.to_i.to_s == number
end

def valid_loan?(amount)
  amount.to_f >= 0.00 && amount != "" && (float?(amount) || integer?(amount))
end

def valid_apr?(apr)
  apr.to_f >= 0.00 && apr.to_f <= 100.00 && apr != "" &&
    (float?(apr) || integer?(apr))
end

def valid_duration?(duration)
  duration.to_f >= 0.00 && duration != "" &&
    (float?(duration) || integer?(duration))
end

def find_monthly_interest(apr)
  ((apr / 100) / 12)
end

def duration_months(duration)
  duration * 12
end

def calculate_again?
  loop do
    continue = gets.chomp
    if continue.downcase == 'y'
      return true
    elsif continue.downcase == 'n'
      messages('goodbye')
      return false
    else
      messages('invalid_choice')
    end
  end
end

def get_loan_duration
  messages('duration')

  duration = ''

  loop do
    duration = gets.chomp
    if valid_duration?(duration)
      return(duration.to_f * 12)
    else
      messages('invalid_years')
    end
  end
end

def monthly_payment(loan, monthly_rate, duration_months)
  loan * (monthly_rate / (1 - (1 + monthly_rate)**(-1 * duration_months)))
end

def get_loan_amount
  messages('loan_amount')

  loan = ''

  loop do
    loan = gets.chomp
    break if valid_loan?(loan)
    messages('invalid_loan')
  end

  loan
end

def get_apr
  messages('APR')

  apr = ''

  loop do
    apr = gets.chomp
    if valid_apr?(apr)
      return find_monthly_interest(apr.to_f)
    else
      messages('invalid_apr')
    end
  end
end

def nan_result(loan, duration_months)
  loan.to_f / duration_months
end

def display_monthly_payment(monthly_payment_amount)
  puts("Your monthly payment is $#{format('%.2f', monthly_payment_amount)}\n\n")
end

loop do
  system("clear")
  messages('welcome')

  loan = get_loan_amount

  monthly_rate = get_apr

  duration_months = get_loan_duration

  monthly_payment_amount =
    monthly_payment(loan.to_f, monthly_rate.to_f, duration_months.to_i)

  monthly_payment_amount = nan_result(loan, duration_months) if
    monthly_payment_amount.nan?

  system("clear")

  display_monthly_payment(monthly_payment_amount)

  messages('another_loan')

  break unless calculate_again?
end
