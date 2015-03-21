source 'https://rubygems.org'

ruby '2.1.5'

gem 'rails', '~> 4.2.0'
gem 'json', '~> 1.8.2'
gem 'pg', '0.17.0'

# jQuery
gem 'jquery-rails'
gem 'jquery-ui-rails'

# Configuration File
gem 'rails_config'

# Active Admin
gem 'activeadmin', github: 'activeadmin'
gem 'active_admin_editor'

# Password encryption
gem 'bcrypt', :require=>'bcrypt'

# Using RVM
gem 'capistrano-rvm', github: 'capistrano/rvm'

gem 'devise'


group :development do
  gem 'web-console', '~> 2.0'
  gem 'pry-rails'
end

group :production do
  gem 'capistrano', '3.4.0'
  gem 'capistrano-bundler', '1.1.4'
  gem 'capistrano-rails', '1.1.2'
  gem 'capistrano-passenger', '0.0.2'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 4.0.2'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'test-unit'
  gem 'minitest', '~> 5.5.1'
  gem 'rspec-rails', '~> 2.0'
  gem 'shoulda'
  gem 'therubyracer'
end



