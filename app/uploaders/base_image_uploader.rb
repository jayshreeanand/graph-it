# encoding: utf-8
class BaseImageUploader < BaseUploader
  include CarrierWave::MiniMagick

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fit => [100, 100]
  end
end
