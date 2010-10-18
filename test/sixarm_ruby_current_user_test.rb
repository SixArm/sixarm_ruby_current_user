require 'test/unit'
require 'sixarm_ruby_current_user'
require 'sixarm_ruby_current_user_id'
require 'active_record_mock'

class Testing < Test::Unit::TestCase

 include CurrentUser
  
 def session
  @session||=Hash.new
 end

 def test_get
  assert_not_nil(session,"session")
  assert_nil(current_user,"current_user")
  assert_nil(current_user_id,"current_user_id")
 end

 def test_set

  # Verify we have a blank slate
  assert_not_nil(session,"session")
  assert_nil(current_user,"current_user")
  assert_nil(current_user_id,"current_user_id")

  # Create mock users
  anne = User.new(:id => 1, :name => 'Anne')
  beth = User.new(:id => 2, :name => 'Beth')
  cate = User.new(:id => 3, :name => 'Cate')

  # Set via object
  current_user=beth
  x=current_user
  assert_equal(beth,x,"beth,x:#{x}")
  assert_not_equal(anne,x,"anne,x:#{x}")
  assert_not_equal(cate,x,"beth,x:#{x}")

  # Clear
  current_user=nil
  assert_nil(current_user,"current_user")
  assert_nil(current_user_id,"current_user_id")

  # Set via id
  current_user_id=2
  assert_equal(beth,x,"beth,x:#{x}")
  assert_not_equal(anne,x,"anne,x:#{x}")
  assert_not_equal(cate,x,"beth,x:#{x}")

 end

end

class User < ActiveRecordMock
end

