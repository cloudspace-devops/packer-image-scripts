rails_env = ENV['RAILS_ENV'] || 'production'
worker_processes 1
preload_app true
working_directory "/srv/www/app/current"
listen "/srv/www/app/unicorn.sock", :backlog => 64
listen 8080, :tcp_nopush => true
timeout 30
pid "/srv/www/app/unicorn.pid"
stderr_path "/var/log/unicorn/stderr.log"
stdout_path "/var/log/unicorn/stdout.log"
preload_app true

GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true

check_client_connection false

before_exec do |server|
  ENV["BUNDLE_GEMFILE"] = "/srv/www/app/current/Gemfile"
end

before_fork do |server, worker|
  old_pid = '/srv/www/app/unicorn.pid.oldbin'
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
