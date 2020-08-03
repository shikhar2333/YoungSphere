class Scenario < ApplicationRecord
    has_one_attached :static_website
    belongs_to :user    
    include AlgoliaSearch
    SECURED_INDEX_NAME = "AR_SCENARIO"
    algoliasearch index_name: SECURED_INDEX_NAME do
        attribute :title, :description, :tags
        searchableAttributes ['unordered(title)', 'unordered(description)', 'unordered(tags)']
    end
end
