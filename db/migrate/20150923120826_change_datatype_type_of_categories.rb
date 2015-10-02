class ChangeDatatypeTypeOfCategories < ActiveRecord::Migration
  def change
  	change_column :categories, :type, :string
  end
end
