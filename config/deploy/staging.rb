# frozen_string_literal: true

server '172.104.175.170', user: 'deploy', roles: %w[app db web]
set :default_stage, 'staging'
set :stage, :staging
set :branch, ENV['BRANCH'] || 'develop'
set :nginx_server_name, 'lostandfound-dev.onbananacoding.com'
set :deploy_to, '/srv/www/apps/lostitem-develop'
# Postgres create db
set :pg_ask_for_password, true # Prompts user for password on execution of setup
