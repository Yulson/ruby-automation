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

      assert_instance_of(String, user.first_name)
      assert_instance_of(String, user.last_name)
  end

   def test_create_board # 2. make sure that board is created and user-creator is a watcher
      user = register_user({})
      board = user.create_board(@boardname)

      assert_instance_of(String, board.boardname)
      assert_instance_of(Array, board.lists)
      assert_equal(board.creator, user)
      assert_true(board.watchers.include? user)
   end

  def test_board_is_assigned_to_user #3. make sure that board, created by user is saved to owned boards and added to watching boards
      user = register_user({})
      board = user.create_board(@boardname)

      assert(user.boards_created.include? board)
      assert(user.boards_watching.include? board)
  end

  def test_add_watchers_to_board #4. make sure that several users are added to watchers to the board
      user1 = register_user({})
      user2 = register_user({})
      board = user1.create_board(@boardname)
      board.add_watcher(user2)

      assert(board.watchers.include? user2)
      assert_equal(board.watchers.length, 2)
  end

   def test_remove_watchers #5. make sure that user was deleted from wathers
      user1 = register_user({})
      user2 = register_user({})
      user3 = register_user({})
      board = user1.create_board(@boardname)
      board.add_watcher(user2)
      board.add_watcher(user3)
      board.remove_watcher(user2)

      assert_equal(board.watchers.length, 2)
      assert(user2.boards_watching.empty?)
   end


 	 def test_create_list #6. make sure that list was created on a board
      user = register_user({})
      board = user.create_board(@boardname)
      list = board.create_list(@listname)

      assert(board.lists.include? list)
      assert_equal(list.sticked_board, board)
   end


   def test_add_card #7. make sure that card was added to the list
      user = register_user({})
      board = user.create_board(@boardname)
      list = board.create_list(@listname)
      card = user.create_card(@cardname, list)

      assert(user.cards_created.include? card)
      assert(list.cards.include? card)
      assert_equal(card.list, list)
   end


 	def test_move_card #8. make sure that card was moved to the other list
      user = register_user({})
      board = user.create_board(@boardname)
      list1 = board.create_list(@listname)
      list2 = board.create_list(@listname2)
      card = user.create_card(@cardname, list1)
      list1.move_card_to_new_list(card, list2)

      assert(list2.cards.include? card)
 	end


  def test_add_comment #9. make sure that the comment was added to the card
      user = register_user({})
      board = user.create_board(@boardname)
      list = board.create_list(@listname)
      card = user.create_card(@cardname, list)
      comment = user.create_comment(card)

      assert_equal(comment.creator, user)
      assert_equal(comment.card, card)
      assert(card.comments.include? comment)
  end


  def test_delete_comment #10.make sure that comment was deleted
    user = register_user({})
    board = user.create_board(@boardname)
    list = board.create_list(@listname)
    card = user.create_card(@cardname, list)
    comment = user.create_comment(card)
    user.delete_comment(comment)

    assert_equal(card.comments.length, 0)
  end
 end

#Test_delete_comment and Test_delete_watcher