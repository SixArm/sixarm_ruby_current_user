# SixArm.com → Ruby → <br> CurrentUser module with current_user methods

* Doc: <http://sixarm.com/sixarm_ruby_current_user/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_current_user>
* Repo: <http://github.com/sixarm/sixarm_ruby_current_user>
<!--header-shut-->


## Introduction

Get and set the current user in the Rails session array.

When you set the current user, this does:
 - @current_user = user
 - @current_user_id = user.id
 - session[:current_user_id] = user.id

For docs go to <http://sixarm.com/sixarm_ruby_current_user/doc>

Want to help? We're happy to get pull requests.


<!--install-open-->

## Install

### Gem

To install this gem in your shell or terminal:

    gem install sixarm_ruby_current_user

### Gemfile

To add this gem to your Gemfile:

    gem 'sixarm_ruby_current_user'

### Require

To require the gem in your code:

    require 'sixarm_ruby_current_user'

<!--install-shut-->


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
