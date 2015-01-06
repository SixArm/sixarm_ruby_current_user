# SixArm.com » Ruby » <br> CurrentUser module with current_user methods

* Doc: <http://sixarm.com/sixarm_ruby_current_user/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_current_user>
* Repo: <http://github.com/sixarm/sixarm_ruby_current_user>
* Email: Joel Parker Henderson, <joel@sixarm.com>


## Introduction

Get and set the current user in the Rails session array.

When you set the current user, this does:
 - @current_user = user
 - @current_user_id = user.id
 - session[:current_user_id] = user.id

For docs go to <http://sixarm.com/sixarm_ruby_current_user/doc>

Want to help? We're happy to get pull requests.


## Install quickstart

Install:

    gem install sixarm_ruby_current_user

Bundler:

    gem "sixarm_ruby_current_user", "~>1.4.6"

Require:

    require "sixarm_ruby_current_user"


## Install with security (optional)

To enable high security for all our gems:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem
    gem sources --add http://sixarm.com

To install with high security:

    gem install sixarm_ruby_current_user --trust-policy HighSecurity


## Example code

    joe = User.find(123)
    self.current_user = joe
    => 
    @current_user == joe
    @current_user_id == 123
    session[:current_user_id] == 123


## Example controller

    class MyController < ApplicationController

      def sign_in(user)
        self.current_user = user
      end

      def sign_out
        self.current_user = nil
      end

      def is_anyone_using_this?
        current_user?
      end

    end


## Example of reloading

For fast speed, we memoize current_user and current_user_id: 
we use fast instance variables @current_user and @current_user_id
rather than reading the slower session[:current_user_id] each time.

To reload @current_user and @current_user_id from session[:current_user_id], 
we use the :reload parameter like this:

    current_user(:reload => true)


## Why use the self prefix?

When we set variables, we must use the "self" prefix because Ruby uses this to do method dispatch.

Right:

    self.current_user = joe

Wrong:

    current_user = joe


## Changes

* 2012-03-14 1.4.6 Update docs, tests
* 2011-05-10 1.4.6 Return nil if user is not found
* 2011-04-26 1.4.4 Add current_user_id methods
* 2011-04-25 1.4.0 Add memoize and :reload => true
* 2011-04-19 1.3.4 Add self and more tests
* 2011-04-18 1.3.2 Update for Ruby 1.9.2 and Rails 3.0.5
## License

You may choose any of these open source licenses:

  * Apache License
  * BSD License
  * CreativeCommons License, Non-commercial Share Alike
  * GNU General Public License Version 2 (GPL 2)
  * GNU Lesser General Public License (LGPL)
  * MIT License
  * Perl Artistic License
  * Ruby License

The software is provided "as is", without warranty of any kind, 
express or implied, including but not limited to the warranties of 
merchantability, fitness for a particular purpose and noninfringement. 

In no event shall the authors or copyright holders be liable for any 
claim, damages or other liability, whether in an action of contract, 
tort or otherwise, arising from, out of or in connection with the 
software or the use or other dealings in the software.

This license is for the included software that is created by SixArm;
some of the included software may have its own licenses, copyrights, 
authors, etc. and these do take precedence over the SixArm license.

Copyright (c) 2005-2015 Joel Parker Henderson
