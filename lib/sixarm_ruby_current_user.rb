# -*- coding: utf-8 -*-
=begin rdoc
Please see README.rdoc
=end


module CurrentUser


  ###
  #
  # Methods for the User model
  #
  ###


  # Get the current user.
  # 
  # This calls User.find_by_id with the current_user_id
  #
  # The current user is memoized as @current_user.
  # To reload, pass :reload => true
  #
  # Return the current user,
  # or nil if the current user id is not set,
  # or raise an exception if the current iser id is invalid
  
  def current_user(ops={})
    if ops[:reload] then @current_user=nil end
    @current_user ||= (current_user_id(ops) ? User.find_by_id(current_user_id) : nil)
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


  ###
  #
  #  Methods for the User id
  #
  ###


  # Get the current user id in the Rails session array.
  #
  # The current user id is memoized as @current_user_id.
  # To reload, pass :reload => true
  #
  # Return the session's current user id.

  def current_user_id(ops={})
    if ops[:reload] then @current_user_id=nil end
    @current_user_id ||= session[:current_user_id]
  end


  # Is there a current user id in the Rails session array?

  def current_user_id?
    return session[:current_user_id] ? true : false
  end


  # Set the current user id in the Rails session array.
  # Return the current user id, suitable for chaining.
  
  def current_user_id=(id)
    @current_user_id=session[:current_user_id]=id
  end


end




