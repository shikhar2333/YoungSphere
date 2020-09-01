class CreateReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions do |t|
      t.references :scenario, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :verb
      t.text :content
      t.json :object

      t.timestamps
    end
  end
end
