class AddTitleToQuestionsets < ActiveRecord::Migration
  def change
    add_column :question_sets, :title, :string
  end
end
