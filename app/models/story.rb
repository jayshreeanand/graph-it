class Story < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :attachment, presence: true

  enum kind: { image: 0, video: 1 }

  before_save :update_kind

  mount_uploader :attachment, StoryAttachmentUploader

  private

  def update_kind
    if attachment.present?
      self.kind = (attachment.content_type.include? 'video') ? 'video' : 'audio'
    end
  end
end
