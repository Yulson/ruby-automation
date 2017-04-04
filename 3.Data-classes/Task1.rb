#1. Create a method which will take a natural number as an argument and will find a sum of all its digits

puts "Enter any natural number"
number = gets.each_char.to_a
index = 0
sum = 0

while index <= number.count
  sum = sum + number[index].to_i
  index = index + 1
end
puts sum



