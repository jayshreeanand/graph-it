class Story < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  enum kind: { image: 0, video: 1 }


  mount_uploader :attachment, StoryAttachmentUploader
end
