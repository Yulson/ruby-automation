# Create 10 any unit tests for this classes and their methods

require 'faker'
require 'selenium-webdriver'
require 'test-unit'
require_relative 'Simple_trello'
require_relative 'User'
require_relative 'Board'
require_relative 'List'
require_relative 'Card'
require_relative 'Comment'

 class Test_Trello < Test::Unit::TestCase
 	include Simple_trello

  def setup
      @boardname = Faker::Hacker.noun
      @listname = Faker::Hacker.noun
      @listname2 = Faker::Hacker.noun
      @cardname = Faker::Hacker.noun
  end

 	def test_create_user  # 1. make sure that user is created with specific user_data
			user = register_user({})

			if (user.first_name.kind_of? String) && (user.last_name.kind_of? String) && (user.last_name.kind_of? String)
					puts 'test_create_user OK'
			else
					puts 'test_create_user FAILED'
			end
  end

   def test_create_board # 2. make sure that board is created and user-creator is a watcher
      user = register_user({})
      board = user.create_board(@boardname)

      if (board.boardname.kind_of? String) && (board.lists.kind_of? Array) && (board.creator == user) && (board.watchers.include?(user))
        puts 'test_create_board OK'
      else
        puts 'test_create_board FAILED'
      end
   end

  def test_board_is_assigned_to_user #3. make sure that board, created by user is saved to owned boards and added to watching boards
      user = register_user({})
      board = user.create_board(@boardname)

      if (user.boards_created.include?(board)) && (user.boards_watching.include?(board))
        puts 'test_board_is_assigned_to_user is OK'
      else
        puts 'test_board_is_assigned_to_user FAILED'
      end
  end

  def test_add_watchers_to_board #4. make sure that several users are added to watchers to the board
      user1 = register_user({})
      user2 = register_user({})
      board = user1.create_board(@boardname)
      board.add_watcher(user2)

      if (board.watchers.include?(user2)) && (board.watchers.length == 2)
        puts 'test_add_watchers_to_board is OK'
      else
        puts 'test_add_watchers_to_board FAILED'
      end
  end

   def test_remove_watchers #5. make sure that user was deleted from wathers
      user1 = register_user({})
      user2 = register_user({})
      user3 = register_user({})
      board = user1.create_board(@boardname)
      board.add_watcher(user2)
      board.add_watcher(user3)
      board.remove_watcher(user2)

      if (board.watchers.include?(user2)) || (user2.boards_watching.include?(board))
        puts 'test_remove_watchers FAILED'
      else
        puts 'test_remove_watchers is OK'
      end
   end


 	 def test_create_list #6. make sure that list was created on a board
      user = register_user({})
      board = user.create_board(@boardname)
      list = board.create_list(@listname)

      if board.lists.include?(list) && (list.sticked_board == board)
        puts 'test_create_list is OK'
      else
        puts 'test_create_list FAILED'
      end
   end


   def test_add_card #7. make sure that card was added to the list
      user = register_user({})
      board = user.create_board(@boardname)
      list = board.create_list(@listname)
      card = user.create_card(@cardname, list)

      if (user.cards_created.include?(card)) && (list.cards.include?(card)) && (card.list == list)
           puts 'test_add_card is OK'
      else
           puts 'test_add_card is FAILED'
      end
   end


 	def test_move_card #8. make sure that card was moved to the other list
      user = register_user({})
      board = user.create_board(@boardname)
      list1 = board.create_list(@listname)
      list2 = board.create_list(@listname2)
      card = user.create_card(@cardname, list1)
      list1.move_card_to_new_list(card, list2)

      if list2.cards.include?(card)
        puts 'test_move_card is OK'
      else
        puts 'test_move_card FAILED'
      end
 	end


  def test_add_comment #9. make sure that the comment was added to the card
      user = register_user({})
      board = user.create_board(@boardname)
      list = board.create_list(@listname)
      card = user.create_card(@cardname, list)
      comment = user.create_comment(card)

      if (comment.creator == user) && (comment.card == card) && (card.comments.include?(comment))
        puts 'test_add_comment is OK'
      else
        puts 'test_add_comment FAILED'
      end
  end


  def test_delete_comment #10.make sure that comment was deleted
    user = register_user({})
    board = user.create_board(@boardname)
    list = board.create_list(@listname)
    card = user.create_card(@cardname, list)
    comment = user.create_comment(card)
    user.delete_comment(comment)

    if card.comments.include?(comment)
      puts 'test_delete_comment FAILED'
    else
      puts 'test_delete_comment is OK'
    end
  end
end