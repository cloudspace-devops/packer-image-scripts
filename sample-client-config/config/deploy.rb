# config valid only for Capistrano 3.1
#lock '3.1.0'

# the repository url is set in config/environment_variables.rb
set :repo_url, %W{#{ENV['REPOSITORY_URL']}}

set :stages, %w(staging production)
set :default_stage, 'staging'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{.env}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :linked_dirs, %w{log}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

set :ssh_options, keys: ['~/.ssh/id_rsa'], forward_agent: true, user: %W{#{ENV['USER']}}

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  # after :restart, :clear_cache do
  #   on roles(:web), in: :groups, limit: 3, wait: 10 do
  #     # Here we can do anything such as:
  #     # within release_path do
  #     #   execute :rake, 'cache:clear'
  #     # end
  #   end
  # end
end

after 'deploy', 'bundler:install'

# runs the specified rake task on the server in the background, without blocking the ssh session
def background_rake(task)
  on roles(:app) do
    execute "cd #{release_path}; ( ( nohup bundle exec rake RAILS_ENV=#{fetch(:rails_env)} #{task} &>/dev/null ) & )"
  end
end

# runs the specified rake task on the server in the foreground, blocking the ssh session
def foreground_rake(task)
  on roles(:app) do
    execute "cd #{release_path} && bundle exec rake RAILS_ENV=#{fetch(:rails_env)} #{task}"
  end
end
