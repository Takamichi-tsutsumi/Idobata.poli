class CreateQuestionSets < ActiveRecord::Migration
  def change
    create_table :question_sets do |t|
      t.integer :q1_id
      t.integer :q2_id
      t.integer :q3_id
      t.integer :q4_id
      t.integer :q5_id
      t.integer :q6_id
      t.integer :q7_id
      t.integer :q8_id
      t.integer :q9_id
      t.integer :q10_id
      t.boolean :status

      t.timestamps null: false
    end
  end
end
