class Story < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :attachment, presence: true

  enum kind: { image: 0, video: 1 }

  before_save :update_kind

  mount_uploader :attachment, StoryAttachmentUploader
  process_in_background :attachment

  def short_location
    location.split(",")[0] || ''
  end

  def resized_attachment
    result = if attachment_url.present?
      if image?
        attachment.image_small.file.try(:exists?) ? attachment.image_small.url : attachment.image.url
      elsif video?
        attachment.video_small.file.try(:exists?) ? attachment.video_small.url : attachment.video.url
      end
    end
    result || ''
  end

  private

  def update_kind
    if attachment.present?
      self.kind = (attachment.content_type.include? 'video') ? 'video' : 'image'
    end
  end
end
