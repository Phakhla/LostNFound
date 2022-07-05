# frozen_string_literal: true

class Post < ApplicationRecord
  enum category: { found_item: 0, lost_item: 1 }
  enum status: { active: 0, found: 1, closed: 2 }

  belongs_to :user
  belongs_to :type

  has_many :comments, dependent: :destroy

  has_many_attached :images, dependent: :destroy

  validates :name, presence: true
  validates :date, presence: true

  validates :lat, numericality: true
  validates :lng, numericality: true

  scope :in_active, -> { where(status: %w[found closed]) }
  # validates :images,
  #           attached: true,
  #           content_type: { in: %w[image/jpeg image/png], message: 'must be jpeg or png.' },
  #           size: { less_than_or_equal_to: 5.megabytes, message: 'oversize limited (5MB)' },
  #           limit: { max: 4, message: 'over limited(4 files)' }

  def owner?(user)
    user_id == user.id
  end
end
