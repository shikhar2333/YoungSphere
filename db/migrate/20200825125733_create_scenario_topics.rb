class CreateScenarioTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :scenario_topics do |t|
      t.references :scenario, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
