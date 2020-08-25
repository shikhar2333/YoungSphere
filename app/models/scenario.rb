# == Schema Information
#
# Table name: scenarios
#
#  id               :bigint           not null, primary key
#  description      :string
#  link_to_scenario :string
#  tags             :string
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_scenarios_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
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
