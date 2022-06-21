# frozen_string_literal: true

class Type < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :type_name, presence: true
end
