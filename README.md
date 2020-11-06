

## Sinatra Portfolio Project - Flatrion school

## Overview

<ul>
  <li>This program is an web application that keep track of task. The web application has all the minimuns required for the Sincatra Project this are</li>
  <li>Build an MVC Sinatra application.</li>
  <li>Use ActiveRecord with Sinatra.</li>
  <li>Use multiple models.</li>
  <li>Use at least one has_many relationship on a User model and one belongs_to relationship on another model.</li>
  <li>Must have user accounts - users must be able to sign up, sign in, and sign out.</li>
  <li>Validate uniqueness of user login attribute (username or email).</li>
  <li>Once logged in, a user must have the ability to create, read, update and destroy the resource that belongs_to user.</li>
  <li>Ensure that users can edit and delete only their own resources - not resources created by other users.</li>
  <li>Validate user input so bad data cannot be persisted to the database.</li>
  <li>BONUS: Display validation failures to user with error messages. (This is an optional feature, challenge yourself and give it a shot!)</li>
</ul>

## About This Project

This project uses the [Sinatra](http://sinatrarb.com/) library, a _microframework_ written in Ruby and used to quickly build web applications.
and Corneal framework

## Installation instructions

Clone this repo into your local environment and run the following commands:

1. `$ gem install bundler` ... to install [Bundler](https://bundler.io/)
1. `$ bundle install` ... to install the [Ruby Gems](https://rubygems.org/).
2. `$ shotgun` ... to boot up your server

##Important parts to consider, after done with the projec:


- different types of http requests (get, post, etc) and when we use one versus another
- you should be able to walk me through a get request from start to finish. For example, I make __ request in the browser, which goes to ___ method in my application, which is then processed by ____.
- you should be able to walk me through a post request from start to finish as well
- what is the difference between rendering and redirecting? Here is a nice blog post on the subject: https://medium.com/@thorntonbrenden/to-render-or-to-redirect-that-is-the-question-b94e3bcac2e0
- when do we need to set instance variables in a controller, and when should we use local variables instead?
- what is the purpose of Rack::MethodOverride, and what does it do?
- what does the .authenticate method do, and where does it come from?
- what is params, and where can we access it in our program? Where do the keys in the params hash come from?
- what is ReST and why is it important?
