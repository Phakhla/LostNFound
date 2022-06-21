# frozen_string_literal: true

def prompt(*args)
  print(*args)
  # gets
  $stdin.gets.chop
end

namespace :deploy do
  desc 'Prepare application folder'
  task :prepare_deploy do
    on roles(:all) do
      execute :sudo, :chown, '-R deploy:deploy', '/srv'
    end
  end

  desc 'Upload application configuration files.'
  task :app_config do
    on roles(:app) do
      upload! StringIO.new(File.read('config/storage.yml')), "#{shared_path}/config/storage.yml", via: :scp
      upload! StringIO.new(File.read('config/credentials.yml.enc')), "#{shared_path}/config/credentials.yml.enc",
              via: :scp
      upload! StringIO.new(File.read('config/application.yml')), "#{shared_path}/config/application.yml",
              via: :scp
      upload! StringIO.new(File.read('config/database.yml')), "#{shared_path}/config/database.yml",
              via: :scp
    end
  end

  desc 'Setup master key on server'
  task :setup_master_key do
    master_key = prompt 'Master key of your application:  '
    on roles(:app) do
      execute "grep -q 'RAILS_MASTER_KEY' ~/.bashrc || echo 'export RAILS_MASTER_KEY=#{master_key}' >> ~/.bashrc"
    end
  end
end
