# encoding: utf-8
class StoryPictureUploader < BaseImageUploader
  version :small do
    process :resize_to_fit => [300, 600]
  end
end
