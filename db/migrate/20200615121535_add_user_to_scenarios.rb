class AddUserToScenarios < ActiveRecord::Migration[6.0]
  def change
    add_reference :scenarios, :user, null: false, foreign_key: true
  end
end
