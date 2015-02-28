working_directory "/var/www/html/rails/solvia.bellonch.com/current"
pid "/var/www/html/rails/solvia.bellonch.com/shared/pids/unicorn.pid"
stderr_path "/var/www/html/rails/solvia.bellonch.com/current/log/unicorn.stderr.log"
stdout_path "/var/www/html/rails/solvia.bellonch.com/current/log/unicorn.stdout.log"
listen "/tmp/unicorn.sock"
timeout 120
worker_processes 1

preload_app true

before_fork do |server, worker|
  # Disconnect since the database connection will not carry over
  if defined? ActiveRecord::Base
    ActiveRecord::Base.connection.disconnect!
  end

  # Quit the old unicorn process
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  # Start up the database connection again in the worker
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
    ActiveRecord::Base.clear_active_connections!
  end
end
