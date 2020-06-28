class Story < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  mount_uploader :picture, StoryAttachmentUploader
end
