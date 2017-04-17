require 'faker'
require_relative 'User'
require_relative 'list'
require_relative 'Comment'


class Card

	attr_reader :cardname, :description, :card_owner, :list, :board, :comments
	attr_accessor :cardname, :description, :card_owner, :list, :board, :comments

	def initialize(cardname, list, user)
			@cardname = cardname
			@description = Faker::Lorem.sentence(1)
			@card_owner = user
			@list = list
			@board = list.sticked_board
			@comments = []
	end

	def to_s
			puts "Card name is: #{@cardname.to_s}\n"
			puts "Card owner is #{@card_owner.username}\n"
			puts "Card is assigned to: #{@list.listname} list \n"
			puts "Card contains #{@comments.length} comments\n"
	end

	def add_comment(card, user)
			comment = Comment.new(self, user)
			@comments << comment
			comment
	end

	def delete_comment(comment)
			@comments.delete(comment)
	end

	def change_list(new_list)
			@list = new_list
	end

end