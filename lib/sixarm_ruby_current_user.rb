=begin rdoc

= SixArm Ruby Gem: CurrentUser module with current_user methods

Author:: Joel Parker Henderson, joelparkerhenderson@gmail.com
Copyright:: Copyright (c) 2005-2010 Joel Parker Henderson
License:: CreativeCommons License, Non-commercial Share Alike
License:: LGPL, GNU Lesser General Public License

Simple gem to get and set the current user,
using the related gem for current_user_id.

For speed, we memoize the current_user.

The current_user_find method also includes the user's roles.

=end


require 'sixarm_ruby_current_user_id'

module CurrentUser

 include CurrentUserId


 # Get the current user:
 #  - if it is already set, then return it without doing a lookup
 #  - otherwise, find the user via current_user_find(rubygem_current_user_id)
 #
 # If the current user is not set, and the current user id is nil,
 # then this returns nil because current_user_find returns nil.

 def current_user
  @current_user ||= current_user_find(current_user_id) 
 end


 # Set the current user and also set the current user id.

 def current_user=(user)
  @current_user = user
  current_user_id = (user ? user.id : nil)
 end


 # Return the current user by calling User.find with a user id;
 # if the user id is nil, then return nil for the current user.

 def current_user_find(id)
   id ? User.find(id) : nil
 end

end
