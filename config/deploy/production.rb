role :app, %W{#{ENV['APP_HOST']}}
role :web, %W{#{ENV['APP_HOST']}}
role :db, %W{#{ENV['APP_HOST']}}

set :branch, 'master'
set :rails_env, 'production'

set :default_environment, 'RAILS_ENV' => 'production'

set :application, "#{ENV['APP_NAME']}"

set :deploy_to, "/srv/www/#{ENV['APP_NAME']}"

namespace :deploy do
  task :start do
    on roles(:app) do
      execute "cd /srv/www/#{ENV['APP_NAME']}/current && "\
      "sudo bundle exec unicorn -E production -c /etc/unicorn/#{ENV['APP_NAME']}.rb -D"
    end
  end

  task :stop do
    on roles(:app) do
      execute "sudo kill -QUIT $(cat /srv/www/#{ENV['APP_NAME']}/unicorn.pid)"
    end
  end

  task :restart do
    on roles(:app) do
      execute "sudo kill -USR2 $(cat /srv/www/#{ENV['APP_NAME']}/unicorn.pid)"
    end
  end
end
