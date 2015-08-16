class CreateManifestCategoryRelations < ActiveRecord::Migration
  def change
    create_table :manifest_category_relations do |t|
      t.integer :manifest_id, null: false
      t.integer :category_id, null: false

      t.timestamps null: false
    end
  end
end
