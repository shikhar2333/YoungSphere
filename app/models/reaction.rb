# == Schema Information
#
# Table name: reactions
#
#  id          :bigint           not null, primary key
#  content     :text
#  object      :json
#  verb        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  scenario_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_reactions_on_scenario_id  (scenario_id)
#  index_reactions_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (scenario_id => scenarios.id)
#  fk_rails_...  (user_id => users.id)
#
class Reaction < ApplicationRecord
  validates_uniqueness_of :user_id, scope: [:verb, :scenario_id]
  belongs_to :scenario
  belongs_to :user
end
