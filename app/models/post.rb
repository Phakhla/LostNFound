# frozen_string_literal: true

class Post < ApplicationRecord
  validates :name, presence: true
end
