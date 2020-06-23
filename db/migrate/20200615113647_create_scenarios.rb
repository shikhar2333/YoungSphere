class CreateScenarios < ActiveRecord::Migration[6.0]
  def change
    create_table :scenarios do |t|
      t.string :link_to_scenario
      t.string :title

      t.timestamps
    end
  end
end
