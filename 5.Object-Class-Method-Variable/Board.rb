# Add watchers to the board
# Delete watcher fom the board
# Get watchers of the board
# Get board creator
# Get lists on the board
# Get cards on the board
# Copy board

require 'faker'
require_relative 'User'
require_relative 'List'

class Board

	attr_reader :boardname, :lists, :creator, :watchers
	attr_accessor :boardname, :lists, :creator, :watchers

	def initialize(board_name, user)
			@boardname = board_name
			@lists = []
			@creator = user
			@watchers = [] << user
	end

	def to_s
			puts "Boardname is #{@boardname.to_s.upcase}, created by #{@creator.username}"
			puts "Board contains #{@lists.length}" + " lists\n"
			puts "Watching by #{@watchers.length}" + " users"
	end

	def add_watcher(user)
			@watchers << user
	end

	def remove_watcher(user)
			@watchers.delete(user)
	end

	def get_watchers
			@watchers.to_s
	end

	def get_creator
			@creator.user_name.to_s
	end

	def change_board_name(new_name)
	 		@boardname = new_name
	end

	def add_list_to_board(list)
	 		@lists << list
	end

	def create_list(listname)
			list = List.new(listname, self)
			add_list_to_board(list)
			list
	end

	def delete_list(list, board)
			board.lists.delete(list)
	end


end