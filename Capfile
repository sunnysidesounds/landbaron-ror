# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'
require 'capistrano/bundler'
require 'capistrano/rails'

# forward SSH keys
set :ssh_options, {:forward_agent => true}

# Using RVM
require 'capistrano/rvm'
set :rvm_type, :user
set :rvm_ruby_version, '2.1.5-p273'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
