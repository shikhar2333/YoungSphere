class CreateScanImages < ActiveRecord::Migration[6.0]
  def change
    create_table :scan_images do |t|
      t.string :label

      t.timestamps
    end
  end
end
