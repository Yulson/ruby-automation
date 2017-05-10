module MobileDevices
	def initialize
		@screen_size = 0
		@time_to_charge_battery = 0
		@time_to_work_without_charging = 0
	end

	attr_reader :time_to_charge_battery

	def call
		puts "calling"
	end

	def charge_battery(charging_time)
		@time_to_charge_battery = charging_time
		if @time_to_charge_battery >= 2
			puts "charging is slow"
		else
			puts "charging is fast"
		end
	end
end

class SmartPhones
	attr_accessor :time_to_charge_battery

	def initialize
		super
		@touch_screen = 'IPS'
		@wi_fi = true
		@bluetooth = true
		@gps = 'unknown'
	end

	def check_gps
		puts "GPS status is #{@gps}"
	end

end

class Iphones < SmartPhones
	include MobileDevices

	def initialize
		super
		@os = 'iOS'
		@gps = true
	end

	def track_device_location
		if @gps
			puts "device is being tracked"
		else
			puts "can not track device without GPS"
		end
	end
end

# class Windphones < SmartPhones

phone1 = Iphones.new
phone1.charge_battery(3)
phone1.check_gps
phone1.track_device_location

