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
    include Rails.application.routes.url_helpers
    is_impressionable
    has_one_attached :static_website
    has_one_attached :avatar
    belongs_to :user
    has_many :scenario_topics, dependent: :destroy
    has_many :topics, through: :scenario_topics
    has_many :reactions, dependent: :destroy
    has_many :comments, as: :commentable
    include AlgoliaSearch
    SECURED_INDEX_NAME = "AR_SCENARIO"
    algoliasearch index_name: SECURED_INDEX_NAME do
        attribute :title, :description, :tags
        searchableAttributes ['unordered(title)', 'unordered(description)', 'unordered(tags)']
    end

    def uploader_name
        self.user.name
    end

    def tags_list
        self.topics.pluck(:name)
    end

    def avatar_url
        self.avatar.present? ? url_for(self.avatar): ''
    end
end
