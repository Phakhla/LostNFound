# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :founds, -> { found_item }, class_name: 'Post', dependent: :destroy, inverse_of: :user
  has_many :losts, -> { lost_item }, class_name: 'Post', dependent: :destroy, inverse_of: :user
end
