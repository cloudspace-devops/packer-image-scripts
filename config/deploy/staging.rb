role :app, %W{#{ENV['STAGING_APP_HOST']}}
role :web, %W{#{ENV['STAGING_APP_HOST']}}
role :db, %W{#{ENV['STAGING_APP_HOST']}}

set :branch, 'master'
set :rails_env, 'staging'

set :default_environment, 'RAILS_ENV' => 'staging'

set :application, %W{#{ENV['STAGING_APP_NAME']}}

set :deploy_to, "/srv/www/#{ENV['STAGING_APP_NAME']}"

namespace :deploy do
  task :start do
    on roles(:app) do
      execute "cd /srv/www/#{ENV['STAGING_APP_NAME']}/current && "\
      "sudo bundle exec unicorn -E staging -c /etc/unicorn/#{ENV['STAGING_APP_NAME']}.rb -D"
    end
  end

  task :stop do
    on roles(:app) do
      execute "sudo kill -QUIT $(cat /srv/www/#{ENV['STAGING_APP_NAME']}/unicorn.pid)"
    end
  end

  task :restart do
    on roles(:app) do
      execute "sudo kill -USR2 $(cat /srv/www/#{ENV['STAGING_APP_NAME']}/unicorn.pid)"
    end
  end
end
