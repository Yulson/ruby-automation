
#User can registered
#User can create a board
#User can start watching other board
#User can unwatch board
#User can delete board
#User can create a list
#User can delete lists from the board


require 'faker'
require_relative 'Board'
require_relative 'List'
require_relative 'Card'
require_relative 'Comment'


class User

	attr_reader :first_name, :last_name, :email, :username, :boards_created, :boards_watching, :cards_created
	attr_accessor :first_name, :last_name, :email, :username, :boards_created, :boards_watching, :cards_created


	def initialize(user_data={})
    	@first_name = user_data[:first_name]  || Faker::Name.first_name
    	@last_name = user_data[:last_name]		|| Faker::Name.last_name
    	@email = user_data[:email]						|| Faker::Internet.email(@first_name + @last_name)
    	@username = user_data[:username]      || Faker::Name.first_name
			@boards_created = []
			@boards_watching = []
			@cards_created = []
	end

	def to_s
			puts "Username is #{@username}\n"
			puts "Email is #{@email}\n"
			puts "User created: #{@boards_created.length} boards\n"
			puts "User is watching: #{@boards_watching.length} boards\n"
			puts "User adeed #{@cards_created.length} cards totally"
	end

	def add_board_to_created_boards(board)
			@boards_created << board
	end

	def add_board_to_watching_boards(board)
			@boards_watching << board
	end

	def create_board(board_name)
		  board = Board.new(board_name, self)
		  add_board_to_created_boards(board)
			add_board_to_watching_boards(board)
			board
	end

	def start_watching_board(board)
			add_board_to_watching_boards(board)
			board.add_watchers(self)
	end

	def unwatch_the_board(board)
			board.remove_watchers(self)
			@boards_watching.delete(board)
	end

	def delete_board(board)
			@boards_created.delete(board)
	end

	def create_card(cardname, list)
			card = Card.new(cardname, list, self)
			@cards_created << card
			list.cards << card
			card
	end

	def create_comment(card)
			comment = Comment.new(card, self)
			card.comments << comment
			comment
	end

	def delete_comment(comment)
			card = comment.card
			card.comments.delete(comment)
	end

end