# -*- coding: utf-8 -*-
require 'minitest/autorun'
require 'sixarm_ruby_current_user'
require 'sixarm_ruby_active_record_mock'
require 'simplecov'
SimpleCov.start

class User < ActiveRecordMock
end

class Testing < Test::Unit::TestCase

  # Mock session
  def session
    @session||={}
  end

  include CurrentUser


  ###
  #
  # Methods for the User model
  #
  ###

  ANNE = User.new(:id => 1, :name => 'Anne')
  BETH = User.new(:id => 2, :name => 'Beth')
  CATE = User.new(:id => 3, :name => 'Cate')

  def test_blank_slate
    assert_nil(current_user, "current_user")
    assert_nil(current_user_id, "current_user_id")
  end

  def test_return_nil_if_not_found
    self.current_user_id=0
    assert_equal(0, current_user_id, "current_user_id")
    assert_nil(current_user, "current_user")
  end

  def test_current_user_memoize
    self.current_user=BETH
    self.current_user_id=CATE.id
    assert_equal(BETH, current_user, "current_user is memoized, so current_user should be beth")
  end

  def test_current_user_id_reload_false
    self.current_user=BETH
    self.current_user_id=CATE.id
    assert_equal(BETH, current_user(:reload=>false), "current_user reload => false, so current_user should be beth")
  end

  def test_current_user_id_reload_true
    self.current_user=BETH
    self.current_user_id=CATE.id
    assert_equal(CATE, current_user(:reload=>true), "current_user reload => true, so current_user should be cate")
  end

  def test_current_user_question
    assert_equal(false, current_user?, "current_user is set, so current_user? should return false")
    self.current_user=BETH
    assert_equal(true, current_user?, "current_user is set, so current_user? should return true")
  end

  def test_current_user_equals
    self.current_user=BETH
    actual=current_user
    assert_equal(BETH, actual, "beth, actual:#{actual}")
  end

  def test_current_user_equals_then_reset
    self.current_user=BETH
    actual=current_user
    assert_equal(BETH, actual, "beth, actual:#{actual}")
    self.current_user=nil
    actual=current_user
    assert_equal(nil, actual, "current_user")
  end



  ###
  #
  # Methods for the User id
  #
  ###

  ID=1234

  def test_current_user_id_default_is_nil
    assert_nil(current_user_id, "current_user_id is not set, so current_user_id should be nil")
  end

  def test_current_user_id_equals
    self.current_user_id=ID
    assert_equal(ID, @current_user_id, "current_user_id is set, so @current_user_id should be an id")
    assert_equal(ID, session[:current_user_id], "current_user_id is set, so session[:current_user_id] should be an id")
  end

  def test_current_user_id_equals_with_round_trip
    self.current_user_id=ID
    assert_equal(ID, current_user_id, "current_user_id is set, so current_user_id should be an id")
  end


  def test_current_user_id_with_memoize
    self.current_user_id=ID
    session[:current_user_id]=ID+1
    assert_equal(ID, current_user_id, "current_user_id is memoized, so current_user_id should be an id")
  end

  def test_current_user_id_reload_false
    self.current_user_id=ID
    session[:current_user_id]=ID+1
    assert_equal(ID, current_user_id(:reload=>false), "current_user_id reload => false, so current_user_id should be an id")
  end

  def test_current_user_id_reload_true
    self.current_user_id=ID
    session[:current_user_id]=ID+1
    assert_equal(ID+1, current_user_id(:reload=>true), "current_user_id reload => true, so current_user_id should be an id")
  end
    
  def test_current_user_id_question_is_false
    assert_equal(false, current_user_id?, "current_user_id is not set, so current_user_id? should be false")
  end

  def test_current_user_id_question_is_true
    self.current_user_id=ID
    assert_equal(true, current_user_id?, "current_user_id is set, so current_user_id? should be true")
  end


end
