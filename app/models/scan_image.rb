class ScanImage < ApplicationRecord
    has_one_attached :scanned_image
    belongs_to :user
    # include AlgoliaSearch
    # SECURED_INDEX_NAME = "Youngsphere"
    # algoliasearch index_name: SECURED_INDEX_NAME do
    #     attribute :label
    #     # searchableAttributes ['unordered(title)']
    # end
end