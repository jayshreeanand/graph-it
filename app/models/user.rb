class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable


  has_many :stories, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  after_create :add_avatar!

  mount_uploader :avatar, AvatarUploader

  def add_avatar!
    identifier = first_name + last_name
    self.remote_avatar_url = "https://www.tinygraphs.com/squares/#{identifier}?theme=berrypie&numcolors=4&size=220&fmt=jpg"
    save!
  end

  def image
    avatar_url.present? ? avatar_url : 'avatar.svg'
  end

  def full_name
    (first_name + ' ' + last_name).titleize
  end

end
