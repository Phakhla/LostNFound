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
  validate  :date_should_not_exceed_present
  validates :type_id, presence: true
  validates :detail, length: { maximum: 500 }, allow_blank: true

  validates :lat, numericality: true
  validates :lng, numericality: true

  scope :in_active, -> { where(status: %w[found closed]) }

  validates :images,
            presence: true,
            attached: true,
            content_type: { in: %w[image/jpeg image/png], message: 'must be jpeg or png.' },
            limit: { max: 10, message: 'over limited(10 files)' }

  attr_accessor :remove_images

  after_save :purge_images, if: :remove_images

  rails_admin do
    include_all_fields
    exclude_fields :type
    field :type_id, :enum do
      enum do
        Type.all.collect { |l| [l.type_name, l.id] }
      end
    end
    edit do
      field :images, :multiple_active_storage do
        delete_method :remove_images
      end
    end
  end

  def purge_images
    Array(remove_images).each do |id|
      ActiveStorage::Attachment.find_by(id:).try(:purge)
    end
  end

  def self.order_nearest(lat, lng)
    sql = sanitize_sql_array(
      [
        '((posts.lat - :lat) * (posts.lat - :lat)) + ((posts.lng - :lng) * (posts.lng - :lng)) ASC',
        { lat:, lng: }
      ]
    )
    order(Arel.sql(sql))
  end

  def owner?(user)
    user_id == user.id
  end

  def date_should_not_exceed_present
    return if date.blank?

    errors.add(:date, 'must not exceed present date') if date > Time.zone.today
  end
end
