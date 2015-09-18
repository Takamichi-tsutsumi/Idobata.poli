class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :question_set_id
      t.integer :q1_ans
      t.integer :q2_ans
      t.integer :q3_ans
      t.integer :q4_ans
      t.integer :q5_ans
      t.integer :q6_ans
      t.integer :q7_ans
      t.integer :q8_ans
      t.integer :q9_ans
      t.integer :q10_ans

      t.timestamps null: false
    end
  end
end
