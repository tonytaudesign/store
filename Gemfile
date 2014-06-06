source 'https://rubygems.org'
ruby '2.0.0'

gem 'dotenv-rails', :groups => [:development, :test]

gem 'bcrypt-ruby', '3.1.2'
gem 'stripe', git: 'https://github.com/stripe/stripe-ruby'
gem 'pry'
gem 'figaro'
gem 'rails', '4.0.1'
gem 'pg'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'factory_girl_rails'

group :doc do
  gem 'sdoc', require: false
end

group :development do
  gem 'capistrano', '>= 3.2.1'
  gem 'capistrano-rbenv', '~> 2.0'           # idiomatic rbenv support
  gem 'capistrano-rbenv-install'             # ensures the right ruby version is installed
  gem 'capistrano-bundler', '~> 1.1.2'       # support for bundler
  gem 'capistrano-rails', '~> 1.0'           # automatic migrations and asset compilation
  gem 'capistrano-unicorn-nginx', '~> 2.0'   # plug-n-play nginx and unicorn
  gem 'capistrano-postgresql', '~> 3.0'      # plug-n-play postgresql
  gem 'capistrano-safe-deploy-to', '~> 1.1'  # ensures deploy path for the app exists
  gem 'capistrano-ssh-doctor'                # helps with debugging ssh-agent forwarding
end