require 'faker'
module Country

	def increase_population(child_borns_per_year)
		@population = population + child_borns_per_year
	end


end



class EuropianCountries

	attr_reader :belongs_to_EU, :currency_rate, :country_name
	attr_accessor :united_countries

	def initialize
		super
		@currency = "euro"
		@location = "Europe"
		$united_countries = []
	end

	def to_s
		puts "Main currency is #{@currency}\n"
		puts "EU consists of the following countries: #{@united_countries}"
	end


	def join_EU
		if @belongs_to_EU == false
			@belongs_to_EU = true
			$united_countries.push(@country_name)
			puts "#{@united_countries}"
		end
		
	end

	def leave_EU
		if @belongs_to_EU == true
			@belongs_to_EU = false
			$united_countries.drop("#{@country_name}")
		end
	end

	def is_country_rich
		if @currency_rate > 3
			puts "Country is a rich country\n"
		elsif @currency_rate == (1..3)
			puts "Country is not bad\n"
		else puts "Country is poor\n" 
		end
	end

end


class Countries < EuropianCountries

	def initialize
		super
		@country_name = Faker::Address.country
		@population = rand(999999)
		@currency_rate = rand(99)
		@child_borns_per_year = rand(999)
		@belongs_to_EU = false
	end

	def to_s
		puts "Welcome to #{@country_name}\n"
		puts "The population of #{country_name} consists of #{@population} people\n"
		puts "Currency rate is #{@currency_rate}\n"
		puts "#{@child_borns_per_year} children born each year in #{@country_name}\n"
		if @belongs_to_EU == false
			puts "#{@country_name} does not belong to EU"
		else puts "#{@country_name} belongs to EU"
		end
		puts "#{@united_countries}"
		puts "============================================="
	end

end


counrty_1 = Countries.new
country_2 = Countries.new
country_3 = Countries.new
country_4 = Countries.new

counrty_1.join_EU
country_2.join_EU
country_3.join_EU
country_4.join_EU

counrty_1.to_s
country_2.to_s
country_3.to_s
country_4.to_s


puts "#{$united_countries}"


