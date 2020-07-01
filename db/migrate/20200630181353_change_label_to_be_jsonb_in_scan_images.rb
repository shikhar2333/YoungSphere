class ChangeLabelToBeJsonbInScanImages < ActiveRecord::Migration[6.0]
  def change
    change_column :scan_images, :label, :jsonb, using: 'label::jsonb'
  end
end
