# -*- coding: utf-8 -*-
=begin rdoc
Please see README.rdoc
=end

require 'sixarm_ruby_current_user_id'

module CurrentUser

 include CurrentUserId


  # Get the current user:
  #  - if it is already set, then return it without doing a lookup
  #  - otherwise, call User.find with the current_user_id
  #
  # Return the current user, or nil if not found
  
  def current_user
    @current_user ||= User.find(self.current_user_id)
  end
  

  # Is there a current user in the Rails session?
  
  def current_user?
    !!self.current_user 
  end


  # Set the current user
  # Return the current user
  
  def current_user=(user)
    self.current_user_id = (user ? user.id : nil)
    @current_user = user
  end

end
