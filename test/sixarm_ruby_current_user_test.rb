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

  include CurrentUser

  ANNE_ID=1
  BETH_ID=2
  CATE_ID=3
  
  ANNE = User.new(:id => ANNE_ID, :name => 'Anne')
  BETH = User.new(:id => BETH_ID, :name => 'Beth')
  CATE = User.new(:id => CATE_ID, :name => 'Cate')

  def session
    @session||=Hash.new
  end

  def test_blank_slate
    assert_nil(self.current_user, "current_user")
    assert_nil(self.current_user_id, "current_user_id")
  end

  def test_current_user_question
    assert_equal(false, self.current_user?, "current_user is set, so current_user? should return false")
    self.current_user=BETH
    assert_equal(true, self.current_user?, "current_user is set, so current_user? should return true")
  end

  def test_current_user_equals
    current_user=BETH
    actual=current_user
    assert_equal(BETH, actual, "beth, actual:#{actual}")
    assert_not_equal(ANNE, actual, "anne, actual:#{actual}")
    assert_not_equal(CATE, actual, "cate, actual:#{actual}")
  end

  def test_current_user_clear
    current_user=ANNE
    assert_equal(ANNE, current_user, "current_user")
    current_user=nil
    assert_nil(current_user, "current_user")
  end

end





