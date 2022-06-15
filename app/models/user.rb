# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :founds, -> { found_item }, class_name: 'Post', dependent: :destroy, inverse_of: :user
  has_many :losts, -> { lost_item }, class_name: 'Post', dependent: :destroy, inverse_of: :user
  has_many :notifications, as: :recipient, dependent: :destroy

  has_one_attached :avatar

  validates :avatar,
            content_type: { in: %w[image/jpeg image/png], message: 'must be jpeg or png.' },
            size: { less_than_or_equal_to: 5.megabytes, message: 'oversize limited (5MB)' },
            allow_blank: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable

  def display_name
    firstname || email
  end
end
