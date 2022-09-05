# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :founds, -> { found_item }, class_name: 'Post', dependent: :destroy, inverse_of: :user
  has_many :losts, -> { lost_item }, class_name: 'Post', dependent: :destroy, inverse_of: :user
  has_many :notifications, as: :recipient, dependent: :destroy

  has_one_attached :avatar
  attr_accessor :remove_avatar

  after_save { avatar.purge if remove_avatar == '1' }
  rails_admin do
    edit do
      include_all_fields
      field :avatar, :active_storage do
        delete_method :remove_avatar
      end
    end
  end

  validates :avatar,
            content_type: { in: %w[image/jpeg image/png], message: 'must be jpeg or png.' },
            size: { less_than_or_equal_to: 5.megabytes, message: 'oversize limited (5MB)' },
            allow_blank: true
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :password,
            format: { without: /\A[ก-๛]+\z/, message: 'should not be in Thai' }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable, :confirmable

  def display_name
    username || email
  end
end
