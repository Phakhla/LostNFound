# frozen_string_literal: true

module PostHelper
  def self.item_detail(data)
    {
      id: data.id,
      location: data.location,
      lat: data.lat,
      lng: data.lng,
      title: data.name,
      category: data.category.camelize(:lower)
    }.to_json
  end
end
