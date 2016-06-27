source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use sqlite3 as the database for Active Record
gem 'pg'

# Use Puma as the app server
gem 'puma'

#database for heavy load
gem 'mongoid', '4.0.2' 
gem 'mongoid-slug'

#two gems to support image for aws for products
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'mongoid-grid_fs', github: 'ahoward/mongoid-grid_fs'
gem "fog"
gem "mini_magick"

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'kaminari'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'rspec-rails', '~> 3.1'     #test framework
  gem 'factory_girl_rails'        #create fixtures for tests
  gem 'timecop'             #create time mockups
  gem 'pry-rails'
  gem 'guard-rspec', require: false
  gem 'capybara'
  gem 'mongoid-rspec'
  #gem 'database_cleaner', '1.4.1'
  gem 'database_cleaner', :github => 'bmabey/database_cleaner'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem "better_errors"

  gem 'faker'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'shoulda-matchers', require: false  
end
# Access an IRB console on exception pages or by using <%= console %> in views
gem 'web-console', '~> 2.0', group: :development  

gem "haml-rails"

gem 'bootstrap-sass', '~> 3.2.0'    #gem for sass
gem 'autoprefixer-rails'
gem 'devise'              #authentication gem
gem 'rails-i18n'#, github: 'svenfuchs/rails-i18n', branch: 'master'
gem "paperclip", "~> 4.2"
