# Require unicorn recipes
require 'capistrano-unicorn'

# RVM
set :rvm_ruby_string, "2.2.0"
set :rvm_type, :system
set :rvm_install_with_sudo, true

# Configuration
set :application, "solvia"
set :keep_releases, 5

# Stages
set :stages, %w(production)
set :default_stage, "production"

# SCM
set :scm, :git
set :deploy_via, :remote_cache
set :repository, "git@github.com:quipuapp/imagine-solvia.git"
set :ssh_options, { port: 8622, forward_agent: true }

# Users
set :use_sudo, false
set :user, "deployer"

# Sidekiq
set :sidekiq_role, :worker

# Misc
set :config_files, %w{ database }.map { |name| "config/#{name}.yml" }
default_run_options[:pty] = true

# Callbacks
after "deploy:update_code", 'solvia:symlink_config'
after "deploy:update", "deploy:cleanup"

after 'deploy:restart', 'unicorn:duplicate'
