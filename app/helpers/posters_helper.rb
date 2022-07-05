# frozen_string_literal: true

module PostersHelper
  def self.generate_qr(url)
    qrcode = RQRCode::QRCode.new(url)

    qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: 'black',
      file: nil,
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 90
    )
  end
end
