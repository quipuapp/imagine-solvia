load 'deploy'
load 'config/deploy'
load 'deploy/assets'

Dir['config/deploy/recipes/*.rb'].each { |plugin| load(plugin) }

require 'capistrano/ext/multistage'
require 'bundler/capistrano'
