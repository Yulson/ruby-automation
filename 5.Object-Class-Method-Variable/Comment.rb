require 'faker'


class Comment

	attr_reader :comment_text, :card, :creator
	attr_accessor :comment_text, :card, :creator

	def initialize(card, user)
		@comment_text = Faker::Lorem.sentences(1)
		@card = card
		@creator = user
	end

end