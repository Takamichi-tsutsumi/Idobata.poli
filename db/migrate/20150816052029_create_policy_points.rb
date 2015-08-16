class CreatePolicyPoints < ActiveRecord::Migration
  def change
    create_table :policy_points do |t|
      t.integer :question_id
      t.integer :political_party_id
      t.float :point

      t.timestamps null: false
    end
  end
end
