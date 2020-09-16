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
class ScenarioSerializer
  include JSONAPI::Serializer
  attributes :title, :created_at, :uploader_name, :description, :tags_list, :link_to_scenario, :avatar_url
end
