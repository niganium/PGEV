class Event < ApplicationRecord
    validates :title, presence: true
    validates :etag_list, presence: true
    validates :area, presence: true
    validates :content, presence: true, length: { in: 1..500 }
    validates :image, presence: true
  
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :comment_users, through: :comments, source: :user
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
    has_many :joins, dependent: :destroy
    has_many :join_users, through: :joins, source: :user

    mount_uploader :image, ImageUploader
    acts_as_taggable_on :etags
    has_many :notifications, dependent: :destroy
end
