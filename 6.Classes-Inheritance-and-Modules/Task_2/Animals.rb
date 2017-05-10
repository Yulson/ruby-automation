# 1. Go through methods lesson and demos once again. 
# Then create 5 simple classes structure with 3 inheritance levels 
# and write unit tests which demonstrate different methods availability levels (public, private, protected)

module Animals

	def initialize
		@number_of_legs = 4
	end

	attr_reader :number_of_legs

	def move
		super
		if @number_of_legs == 2
			puts "animal is slow"
		else
			puts "animal is fast"
		end
	end

end


class WildAnimals
	attr_accessor :number_of_legs

	def initialize
		@weight = 15
		@color = "different"
		@number_of_stripes = 0
	end

	def hunt
		puts "hunting"
	end

	def have_dangerous_attributes
		puts "I have dangerous attributes"
	end

	def check_color
		puts "my color is #{@color}"
	end

end


class Tigers < WildAnimals
	include Animals

	def initialize
		super
		@weight = 100
		@color = "black and yellow"
		@number_of_stripes = 10
		# @number_of_legs = 4
	end

	def roak
		puts "roaking"
	end

	def fight
		puts "fighting with clutches"
	end
end

tiger_1 = Tigers.new
tiger_1.roak
tiger_1.fight
tiger_1.hunt
tiger_1.check_color


