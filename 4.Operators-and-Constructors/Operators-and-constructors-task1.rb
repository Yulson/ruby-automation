#1. Create method which gets 10 random integers (from 0 to 9) (generate it using while or until)

#before output for each next number we should puts "========="
#if number is even or odd it should puts string "the number is even" or "the number is odd"
#if it's more (or less) than 5 it should puts appropriate string "the number is more (or less) than 5"
#in case we've got "0" we should puts "we've got 0"
#in each case we should get 2 messages except the '0' case


	def generate_array
		@array_of_integers = []
		i = 0 
		while i < 10
		  	num = rand(9) 
		  	@array_of_integers.push(num)
		  	i = i + 1
		end
		puts @array_of_integers
	end


	def compare_with_0(num)
		if  num == 0
			puts 'we have got ' + num.to_s
			puts '====================='	
		end
	end


	def compare_with_5(num)
		if num > 5
			puts num.to_s + ' the number is more than 5'
		elsif num < 5 && num != 0
			puts num.to_s + ' the number is less than 5'
		elsif num == 5
			puts 'we have got ' + num.to_s
		end
	end
			

	def print_array
		generate_array
		@array_of_integers.each do |num|
			compare_with_5(num)
			compare_with_0(num)
			if num.odd? 
				puts ' the number is odd'
				puts '====================='
			elsif num.even? && num != 0
		 		puts ' the number is even'
		 		puts '====================='
			end
		end
	end

	print_array



