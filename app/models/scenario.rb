class Scenario < ApplicationRecord
    has_one_attached :static_website
    belongs_to :user
end
