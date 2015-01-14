# config valid only for Capistrano 3.1
lock '3.3.5'

set :application, 'codelitt'
set :repo_url, 'git@github.com:codelittinc/codelitt.git'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :pty is false
set :pty, true

set :user, 'deploy'

set :ssh_options, { :forward_agent => true }

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml config/passwords.rb}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system db}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Restart passenger by creating the restart.txt file
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

namespace :compass do
  desc 'Compile Sass to CSS'
  task :compile do
    on roles(:web) do
      within "#{fetch(:deploy_to)}/current/" do
        with rails_env: fetch(:env) do
          execute :bundle, :exec, 'compass compile'
        end
      end
    end
  end
end

# Compile stylesheets before server restarts
before "deploy:restart", "compass:compile"

# After restart migrate and compile assets
after 'deploy:restart', 'deploy:migrate', 'deploy:compile_assets'
