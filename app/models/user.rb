class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable


  has_many :stories, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  mount_uploader :avatar, AvatarUploader


  def remove_image
    avatar = nil
    save!
  end
end
