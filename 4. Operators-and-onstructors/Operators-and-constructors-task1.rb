#1. Create method which gets 10 random integers (from 0 to 9) (generate it using while or until)

#before output for each next number we should puts "========="
#if number is even or odd it should puts string "the number is even" or "the number is odd"
#if it's more (or less) than 5 it should puts appropriate string "the number is more (or less) than 5"
#in case we've got "0" we should puts "we've got 0"
#in each case we should get 2 messages except the '0' case



array_of_integers = []
i = 0 
while i < 10
  num = rand(9) 
  array_of_integers.push(num)
  i = i + 1
end

puts array_of_integers
array_of_integers.each do |num|

if  num == 0
	puts 'we have got 0'
	puts '=========='

elsif num == 5
	puts 'the number is odd'
	puts 'the number is 5'
	puts '=========='

elsif num.odd? && num <5
	puts 'the number is odd'
	puts 'the number is less than 5'
	puts '=========='

elsif num.odd? && num >5
	puts 'the number is odd'
	puts 'the number is more than 5'
	puts '=========='
		
elsif num.even? && num <5
	puts 'the number is even'
	puts 'the number is less than 5'
	puts '=========='

else num.even? && num >5
	puts 'the number is even'
	puts 'the number is more than 5'
	puts '=========='	
end
end



	
		