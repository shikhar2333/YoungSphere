class ShowScenarioSerializer
  include JSONAPI::Serializer
  attributes :title, :created_at, :uploader_name, :description, :tags_list, :link_to_scenario, :avatar_url, :num_of_likes
  attribute :current_user_like do |object, params|
    object.reactions.find_by(verb: 'like', user_id: params[:current_user_id]).present?
  end
  has_many :comments
end
