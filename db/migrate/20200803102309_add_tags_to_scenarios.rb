class AddTagsToScenarios < ActiveRecord::Migration[6.0]
  def change
    add_column :scenarios, :tags, :string
  end
end
