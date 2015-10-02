class CreateManifestRelations < ActiveRecord::Migration
  def change
    create_table :manifest_relations do |t|
      t.integer :manifest_id
      t.integer :public_manifest_id

      t.timestamps null: false
    end
  end
end
