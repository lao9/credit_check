require 'pry'

def credit_check (card_number)

  even_sum = 0
  odd_sum = 0

  # reverse card number
  card_number.reverse!

  # iterate through each number in the string
  card_number.length.times do |item|
    # if index is odd, then we need to double it
    if item.odd?
      # if the double of the value at the odd index is greater than 9...
      # we need to sum the tens and ones value together
      odd_value = sum_values_greater_than_9((card_number[item].to_i)*2)
      # now we need to sum the values of the odd indices together
      odd_sum += odd_value
    else
      # sum the values of the even indices together
      even_sum += card_number[item].to_i
    end
  end

  # validate that the sum modulo 10 = 0
  modulo_validator(even_sum + odd_sum)

end

output = def sum_values_greater_than_9(value)
  if value > 9
    # break apart the number into its tens and ones part, sum them together
    output = value.to_s[0].to_i + value.to_s[1].to_i
  else
    output = value
  end
end

def modulo_validator(result)
  if result % 10 == 0
    puts "The number is valid!"
  else
    puts "The number is invalid!"
  end
end

card_number1 = "4929735477250543" #valid
card_number2 = "5541808923795240" #valid
card_number3 = "4024007136512380" #valid
card_number4 = "6011797668867828" #valid
card_number5 = "5541801923795240" #invalid
card_number6 = "4024007106512380" #invalid
card_number7 = "6011797668868728" #invalid
card_number8 = "342804633855673" #AmEx valid
card_number9 = "342801633855673" #AmEx invalid

credit_check(card_number1)
credit_check(card_number2)
credit_check(card_number3)
credit_check(card_number4)
credit_check(card_number5)
credit_check(card_number6)
credit_check(card_number7)
credit_check(card_number8)
credit_check(card_number9)
