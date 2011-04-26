# -*- coding: utf-8 -*-
require 'test/unit'
require 'sixarm_ruby_current_user'
require 'sixarm_ruby_current_user_id'
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

  ANNE = User.new(:id => 1, :name => 'Anne')
  BETH = User.new(:id => 2, :name => 'Beth')
  CATE = User.new(:id => 3, :name => 'Cate')

  def test_blank_slate
    assert_nil(current_user, "current_user")
    assert_nil(current_user_id, "current_user_id")
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

end





