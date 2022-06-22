# frozen_string_literal: true

User.create_with(password: 'password').find_or_create_by!(email: 'admin@bananacoding.com')
User.create_with(password: 'password').find_or_create_by!(email: 'user@bananacoding.com')
