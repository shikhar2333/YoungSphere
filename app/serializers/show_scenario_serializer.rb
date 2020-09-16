class ShowScenarioSerializer
  include JSONAPI::Serializer
  attributes :title, :created_at, :uploader_name, :description, :tags_list, :link_to_scenario, :avatar_url
  has_many :comments
end
