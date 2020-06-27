# encoding: utf-8
class BaseImageUploader < BaseUploader
  include CarrierWave::MiniMagick

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fit => [50, 50]
  end
end
