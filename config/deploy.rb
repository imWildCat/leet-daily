# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, 'leet_daily'
set :repo_url, 'https://github.com/imWildCat/leet-daily.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"
append :linked_files, 'config/database.yml', 'config/master.key', 'config/credentials.yml.enc'

before 'deploy:check:linked_files', 'deploy:copy_file'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'


# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

# puma config
set :puma_threads, [4, 8]
set :puma_workers, 0
set :puma_bind, "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log, "#{release_path}/log/puma.access.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil

# As for the Rails app behind nginx with SSL:
# https://github.com/rails/rails/issues/22965#issuecomment-172929004
# To solve the "Request origin does not match request base_url" problem

namespace :deploy do
  desc 'Copy files'
  task :copy_file do
    on roles(:all) do |host|
      ['credentials.yml.enc'].each do |f|
        upload! './config/' + f, "#{shared_path}/config/" + f
      end
    end
  end

  desc 'Db seed'
  task :seed_db do
    on primary fetch(:migration_role) do
      within current_path do
        with rails_env: fetch(:stage) do
          execute :bundle, "exec rake db:seed"
        end
      end
    end
  end
  after 'deploy:migrate', 'deploy:seed_db'
end

# Ref: https://gist.github.com/joost/9343156
# Currently it does not work
namespace :rails do
  desc 'Open the rails console on primary app server'
  task :console do
    on roles(:app), primary: true do
      rails_env = fetch(:stage)
      execute_interactively "#{bundle_cmd} #{current_path}/script/rails console #{rails_env}"
    end
  end

  desc 'Open the rails dbconsole on primary db server'
  task :dbconsole do
    on roles(:db), primary: true do
      rails_env = fetch(:stage)
      execute_interactively "#{bundle_cmd} #{current_path}/script/rails dbconsole #{rails_env}"
    end
  end

  def execute_interactively(command)
    user = fetch(:user)
    port = fetch(:port) || 22
    cmd = "ssh -l #{user} #{host} -p #{port} -t 'cd #{deploy_to}/current && #{command}'"
    info "Connecting to #{host}"
    exec cmd
  end

  def bundle_cmd
    if fetch(:rbenv_ruby)
      # FIXME: Is there a better way to do this? How does "execute :bundle" work?
      "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{File.join(fetch(:rbenv_path), '/bin/rbenv')} exec bundle exec"
    else
      "ruby "
    end
  end
end