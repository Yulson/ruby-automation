require 'faker'
require_relative 'User'
require_relative 'Board'
require_relative 'Card'

class List

	
	attr_reader :listname, :cards, :sticked_board
	attr_accessor :listname, :cards, :sticked_board

	def initialize(listname, board)
			@listname = listname
			@cards = []
			@sticked_board = board
	end

	def to_s
			puts "List name: #{@listname}\n"
			puts "There are #{@cards.length} cards in a list"
			puts "List was created on a board: #{@sticked_board.boardname}"
	end
	
 	def add_card(card)
 			@cards << card
 	end

 	def get_cards_by_list(list_name)
 			@listname.find {|card| card.listname == list_name}
	end

	def create_card(cardname)
			card = Card.new(cardname, self)
			@cards << card
	end

	def delete_card(card)
			@cards.delete(card)
	end

	def move_card_to_new_list(card, list)
			self.delete_card(card)
			card.change_list(list)
			list.add_card(card)
	end

	def get_list_creator
			list_creator = @sticked_board.creator
	end

	def is_card_belonged_to_list?(card, list)
			list.cards.include?(card.cardnamr) ? true : false
	end

end

