# -*- coding: utf-8 -*-
=begin rdoc
Please see README.rdoc
=end

require 'sixarm_ruby_current_user_id'

module CurrentUser

 include CurrentUserId


  # Get the current user:
  #  - if it is already set, then return it without doing a lookup
  #  - otherwise, find the user via #current_user_find
  #
  # If the current user is not set, and the current user id is nil,
  # then this returns nil because current_user_find returns nil.
  
  def current_user
    @current_user ||= current_user_find_by_id(current_user_id)
  end
  

  # Set the current user and also set the current user id.
  
  def current_user=(user)
    @current_user = user
    return current_user_id = (user ? user.id : nil)
  end
  

  # Return the current user by calling User.find with a user id.
  # If the user id is nil, then return nil for the current user.
  
  def current_user_find_by_id(id)
    return id ? User.find(id) : nil
  end
  

end
