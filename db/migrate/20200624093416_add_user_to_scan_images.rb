class AddUserToScanImages < ActiveRecord::Migration[6.0]
  def change
    add_reference :scan_images, :user, null: false, foreign_key: true
  end
end
