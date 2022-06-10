# frozen_string_literal: true

class Post < ApplicationRecord
  enum category: { found_item: 0, lost_item: 1 }
  enum types: { personal_items: 0, other: 1 }
  enum status: { no_found: 0, found: 1 }

  belongs_to :user
  has_many_attached :images, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :images,
            attached: true,
            content_type: { in: %w[image/jpeg image/png], message: 'must be jpeg or png.' },
            size: { less_than_or_equal_to: 5.megabytes, message: 'oversize limited (5MB)' },
            limit: { max: 4, message: 'over limited(4 files)' },
            allow_blank: true
end
