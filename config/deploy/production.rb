set :branch, "production"
set :rails_env, "production"
set :deploy_to, "/var/www/html/rails/solvia.bellonch.com"

server "moroder.bellonch.com", :app, :web, :db, primary: true
