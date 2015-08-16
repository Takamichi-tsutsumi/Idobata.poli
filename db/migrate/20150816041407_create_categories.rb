class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :type, null: false
      t.string :name, null: false 
      t.text :content

      t.timestamps null: false
    end
  end
end
