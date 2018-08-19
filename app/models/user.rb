class User < ApplicationRecord
    validates :name, presence: true, length:{maximum: 30}
    validates :email, presence: true, length:{maximum: 80} ,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    before_save{email.downcase!}
    has_secure_password
    validates :password, presence: true, length: {minimum: 6}

    has_many :event, dependent: :destroy
    has_many :comments
    has_many :favorites, dependent: :destroy
    has_many :favorite_events, through: :favorites, source: :event
    has_many :joins, dependent: :destroy
    has_many :join_events, through: :joins, source: :event

    mount_uploader :icon_image, IconImageUploader
end
