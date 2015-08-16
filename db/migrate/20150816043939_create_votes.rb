class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :manifest_id, null: false
      t.text    :comment
      t.boolean :point, null: false

      t.timestamps null: false
    end
  end
end
