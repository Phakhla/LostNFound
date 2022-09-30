# frozen_string_literal: true

module PostHelper
  def self.item_detail(data)
    {
      id: data.id,
      location: data.location,
      lat: data.lat,
      lng: data.lng,
      title: data.name,
      path: Rails.application.routes.url_helpers.post_path(data),
      category: data.category.camelize(:lower)
    }.to_json
  end
end
