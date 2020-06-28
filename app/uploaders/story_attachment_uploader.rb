# encoding: utf-8
class StoryAttachmentUploader < BaseUploader
  include CarrierWave::MiniMagick
  include CarrierWave::Video
  include CarrierWave::Backgrounder::Delay

  def extension_whitelist
    %w(jpg jpeg gif png mp4)
  end

  # version :small do
  #   process :resize_to_fit => [300, 600]
  # end

  version :video, if: :video? do
    # process :encode
    process encode_video: [:mp4, resolution: "200x200"]
  end

  version :image, if: :image? do
    process :resize_to_fit => [600, 300]
  end

  protected

  def image?(new_file)
    new_file.content_type.include? 'image'
  end

  def video?(new_file)
    new_file.content_type.include? 'video'
  end
end
