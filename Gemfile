source 'https://rubygems.org'

## General-purpose

# Rails
gem 'rails', '4.1.7'

# Frontend
gem 'compass-rails'
gem 'sass-rails'
gem 'foundation-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'rails4-autocomplete'

# Markup
gem 'slim-rails'

# Database
gem 'mysql2'
gem 'sqlite3'

# Deployment
gem 'capistrano'
gem 'capistrano_colors', :require => false
gem 'rvm-capistrano'
gem 'capistrano-unicorn', :require => false

## Groups

# Development
group :development do
  gem 'spring'
  gem 'quiet_assets'
  gem 'pry-rails'
end

# Production
group :production, :staging do
  gem 'unicorn'
  gem 'unicorn-worker-killer'
  gem 'rollbar'
end
