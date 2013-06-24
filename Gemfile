source 'https://rubygems.org'

gem 'rails', '3.2.13'
ruby '2.0.0'

gem 'pg'
gem 'will_paginate'
gem 'inherited_resources'
gem 'rack-offline', :git => 'git://github.com/wycats/rack-offline.git', :ref => '4b92a41c23f2b2e2167610f17e388db606b5046a'

group :development do
  gem 'guard-livereload', require: false
end

group :test, :development do
  gem 'rspec-rails', require: false
end

group :test do
  gem 'capybara', '~> 2.0.0'
  gem 'selenium-webdriver'
  gem 'capybara-firebug'
  gem 'poltergeist'
  gem 'faker'
  gem 'database_cleaner'
end

group :assets do
  gem 'coffee-rails'
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'jquery-rails'
  gem 'sprockets-commonjs'
  gem 'backbone-on-rails'
end
