class ScenarioSerializer
  include JSONAPI::Serializer
  attributes :title, :created_at, :uploader_name, :description, :tags_list, :link_to_scenario
end
