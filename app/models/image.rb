class Image < ApplicationRecord
  belongs_to :supplier
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
end
