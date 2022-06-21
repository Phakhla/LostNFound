# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock '~> 3.17.0'

set :application, 'lostitem'
set :repo_url, 'git@ssh.dev.azure.com:v3/bananacoding/Lostitem/Lostitem'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :default_stage, 'production'
# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/srv/www/apps/lostitem'

# Default value for :format is :airbrussh.
# set :format, :airbrussh
# puma setup
set :puma_threads,    [4, 16]
set :puma_workers,    1
# Don't change these unless you know what you're doing
set :use_sudo,        false
set :stage,           :production
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :puma_preload_app, false
set :puma_daemonize, false
set :puma_worker_timeout, nil
set :puma_init_active_record, true # Change to true if using ActiveRecord
set :puma_service_unit_name, "puma_#{fetch(:application)}"
# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'

# Default value for :linked_files is []
append :linked_files, 'config/database.yml', 'config/storage.yml', 'puma.rb', 'config/credentials.yml.enc',
       'config/application.yml', 'config/master.key'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', '.bundle', 'public/system', 'public/uploads',
       'storage'
# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 5
set :rbenv_type, :user
set :rbenv_ruby, '3.1.2'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w[rake gem bundle ruby rails]
# Default value for local_user is ENV['USER']

# Remove if not using Webpacker
set :assets_prefix, 'packs'

set :nginx_config_name, fetch(:application).to_s
set :nginx_flags, 'fail_timeout=0'
set :nginx_http_flags, fetch(:nginx_flags)
set :nginx_conf_path, '/etc/nginx/conf.d'
set :conditionally_migrate, true # Only attempt migration if db/migrate changed

namespace :deploy do
  desc 'Restart application'
  Rake::Task['puma:restart'].clear_actions
  Rake::Task['deploy:assets:backup_manifest'].clear_actions
  task :restart do
    on roles(:app) do
      execute "sudo systemctl restart #{fetch(:puma_service_unit_name)}"
    rescue StandardError
      execute "sudo systemctl start #{fetch(:puma_service_unit_name)}"
    end
  end
  after :finishing, :restart
end
