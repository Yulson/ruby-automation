# Create 10 any unit tests for this classes and their methods

require 'faker'
require 'selenium-webdriver'
require 'test-unit'
require 'rspec'
require_relative 'Simple_trello'
require_relative 'User'
require_relative 'Board'
require_relative 'List'
require_relative 'Card'
require_relative 'Comment'

 class Test_Trello < Test::Unit::TestCase
 	include Simple_trello
  include RSpec::Matchers

  def setup
      @boardname = Faker::Hacker.noun
      @listname = Faker::Hacker.noun
      @listname2 = Faker::Hacker.noun
      @cardname = Faker::Hacker.noun
  end

 	def test_create_user  # 1. make sure that user is created with specific user_data
			user = register_user({})

      expect(user.first_name).should be_instance_of(String)
      expect(user.last_name).should be_instance_of(String)
  end

   def test_create_board # 2. make sure that board is created and user-creator is a watcher
      user = register_user({})
      board = user.create_board(@boardname)

      expect(board.boardname).should be_instance_of(String)
      expect(board.lists).should be_instance_of(Array)
      expect(board.creator).to eql(user)
      expect
      assert_equal(board.creator, user)
      expect(board.watchers).to include(user)
   end

  def test_board_is_assigned_to_user #3. make sure that board, created by user is saved to owned boards and added to watching boards
      user = register_user({})
      board = user.create_board(@boardname)

      expect(user.boards_created).to include(board)
      expect(user.boards_watching).to include(board)
  end

  def test_add_watchers_to_board #4. make sure that several users are added to watchers to the board
      user1 = register_user({})
      user2 = register_user({})
      board = user1.create_board(@boardname)
      board.add_watcher(user2)

      expect(board.watchers).to include(user2)
      expect(board.watchers.length).to eql(2)
  end

   def test_remove_watchers #5. make sure that user was deleted from wathers
      user1 = register_user({})
      user2 = register_user({})
      user3 = register_user({})
      board = user1.create_board(@boardname)
      board.add_watcher(user2)
      board.add_watcher(user3)
      board.remove_watcher(user2)

      expect(board.watchers.length).to eql(2)
      expect(user2.boards_watching).should be_empty
   end


 	 def test_create_list #6. make sure that list was created on a board
      user = register_user({})
      board = user.create_board(@boardname)
      list = board.create_list(@listname)

      expect(board.lists).to include(list)
      expect(lists.sticked_board).to eql(board)
   end


   def test_add_card #7. make sure that card was added to the list
      user = register_user({})
      board = user.create_board(@boardname)
      list = board.create_list(@listname)
      card = user.create_card(@cardname, list)

      expect(user.cards_created).to include(card)
      expect(list.cards).to include(card)
      expect(card.list).to eql(list)
   end


 	def test_move_card #8. make sure that card was moved to the other list
      user = register_user({})
      board = user.create_board(@boardname)
      list1 = board.create_list(@listname)
      list2 = board.create_list(@listname2)
      card = user.create_card(@cardname, list1)
      list1.move_card_to_new_list(card, list2)

      expect(list2.cards).to include(card)
 	end


  def test_add_comment #9. make sure that the comment was added to the card
      user = register_user({})
      board = user.create_board(@boardname)
      list = board.create_list(@listname)
      card = user.create_card(@cardname, list)
      comment = user.create_comment(card)

      expect(comment.creator).to eql(user)
      expect(comment.card).to eql(card)
      expect(card.comments).to include(comment)
  end


  def test_delete_comment #10.make sure that comment was deleted
    user = register_user({})
    board = user.create_board(@boardname)
    list = board.create_list(@listname)
    card = user.create_card(@cardname, list)
    comment = user.create_comment(card)
    user.delete_comment(comment)

    expect(card.comments).should be_empty
  end
 end

#Test_delete_comment and Test_delete_watcher