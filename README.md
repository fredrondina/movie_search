# README

This is a simple movie search and review application.

You are able to search movies by title, view thier attributes, as well as leave a rating of up or down for each movie

local installation instructions 
1. install and configure ruby 2.5.0 and rails 6.0.3
2. clone directory
3. run bundle install
4. run bundle exec figaro install
5. in application.yml add moviedb key as ENV['movie_db_key'] = YOU KEY HERE
6. run rails db:create, run rails db:migrate
7. run rails s to start local instance and enjoy!
