# frozen_string_literal: true

class Found < ApplicationRecord
  has_many_attached :images
  validate :check_images_validate
  validate :check_limit_images

  private

  def check_images_validate
    if images.attached?
      images.each do |img|
        if !img.content_type.in?(%w[image/jpeg image/png]) # Only jpeg and PNG
          errors.add(:image, 'must be jpeg or png.')
        elsif img.content_type.in?(%w[image/jpeg image/png]) && img.byte_size > (5 * 1024 * 1024) # Limit size 5MB
          errors.add(:image, 'oversize limited (5MB)')
        end
      end
    end
  end

  def check_limit_images
    errors.add(:images, 'over limited(4 files)') if images.length > 4
  end
end
