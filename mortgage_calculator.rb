def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do # main loop
  prompt("Welcome to the Mortgage Calculator!")

  prompt("What is the loan amount?")

  amount = ''
  loop do
    amount = Kernel.gets().chomp()

    if amount.empty?() || amount.to_f < 0
      prompt("Must enter positive number.")
    else
      break
    end
  end

  prompt("What is your annual percentage rate (APR)?")
  prompt("For example, 5 for 5% or 3.5 for 3.5%")

  interest_rate = ''
  loop do
    interest_rate = Kernel.gets().chomp

    if interest_rate.empty?() || interest_rate.to_f < 0
      prompt("Must enter a positive number.")
    else
      break
    end
  end

  prompt("What is the duration of the loan in years?")

  loan_duration_years = ''
  loop do
    loan_duration_years = Kernel.gets().chomp()

    if loan_duration_years.empty?() || loan_duration_years.to_i < 0
      prompt("Enter a valid number.")
    else break
    end
  end

  p = amount.to_f
  j = (interest_rate.to_f / 100) / 12
  n = loan_duration_years.to_f * 12
  m = (p * (j / (1 - (1 + j)**-n))).round(2)

  prompt("Your monthly payment is $#{m}.")
  prompt("Would you like to perform another calcualtion? ('Y' for 'yes' or 'N'
  for 'no')")
  answer = Kernel.gets().chomp()
  break unless answer.downcase == 'y'
end

prompt("Thank you for using the mortgage calculator. Goodbye!")