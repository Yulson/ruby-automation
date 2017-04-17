require_relative 'User'
require_relative 'Board'
require_relative 'List'
require_relative 'Card'
require_relative 'Comment'

module Simple_trello

	def register_user(user_data)
	  	user = User.new unless user_data.empty?
	  	user = user_data.empty? ? User.new : User.new(user_data)
	  	user
  end

end