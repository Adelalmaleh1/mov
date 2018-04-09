# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"

set :application, 'mov'
set :repo_url, "git@github.com:Adelalmaleh1/mov.git"
set :branch, :master
set :deploy_to, '/home/deploy/sites'
set :pty, true
set :linked_files, %w{database.yml application.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :keep_releases, 5
set :rvm_type, :user
set :rbenv_version, 'ruby-2.2.3' # Edit this if you are using MRI Ruby
# set :rbenv_path

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end