class AddDescriptionToScenarios < ActiveRecord::Migration[6.0]
  def change
    add_column :scenarios, :description, :string
  end
end
