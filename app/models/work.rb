class Work < ApplicationRecord
  mount_uploader :image, ImagesUploader
  has_many :progresses
end
