# Post Class
# Author: Dae
class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  mount_uploader :pic_upload, PicUploadUploader
end
