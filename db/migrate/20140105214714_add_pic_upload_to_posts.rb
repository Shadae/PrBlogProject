# Pic Upload
class AddPicUploadToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :pic_upload, :string
  end
end
