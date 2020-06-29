# encoding: utf-8
class StoryAttachmentUploader < BaseUploader
  include CarrierWave::MiniMagick
  include CarrierWave::Video
  include CarrierWave::Backgrounder::Delay

  def extension_whitelist
    %w(jpg jpeg gif png mp4)
  end

  version :video, if: :video? do
    process encode_video: [:mp4, resolution: '480']
  end

  version :video_small, if: :video? do
    process encode_video: [:mp4, resolution: '240']
  end

  version :image, if: :image? do
    process resize_to_fill: [600, 1200]
  end

  version :image_small, if: :image? do
    process resize_to_fill: [300, 600]
  end

  protected

  def image?(new_file)
    new_file.content_type.include? 'image'
  end

  def video?(new_file)
    new_file.content_type.include? 'video'
  end
end
