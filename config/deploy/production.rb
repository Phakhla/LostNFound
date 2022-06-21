# frozen_string_literal: true

set :application, 'lostitem_production'
server '172.104.175.170', user: 'deploy', roles: %w[app db web]
set :branch, ENV['BRANCH'] || 'main'
set :nginx_server_name, 'lostandfound.onbananacoding.com'
set :deploy_to, '/srv/www/apps/lostitem-production'
set :puma_service_unit_name, "puma_#{fetch(:application)}"
# Postgres create db
set :pg_ask_for_password, true # Prompts user for password on execution of setup
