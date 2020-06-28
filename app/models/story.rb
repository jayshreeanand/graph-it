class Story < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :attachment, presence: true

  enum kind: { image: 0, video: 1 }

  before_save :update_kind

  mount_uploader :attachment, StoryAttachmentUploader


  def short_location
    location.split(",")[0] || ''
  end

  private

  def update_kind
    if attachment.present?
      self.kind = (attachment.content_type.include? 'video') ? 'video' : 'image'
    end
  end
end
