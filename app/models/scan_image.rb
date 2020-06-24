class ScanImage < ApplicationRecord
    has_one_attached :scanned_image
    belongs_to :user
end
