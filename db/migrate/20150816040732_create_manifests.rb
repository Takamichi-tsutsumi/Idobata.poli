class CreateManifests < ActiveRecord::Migration
  def change
    create_table :manifests do |t|
      t.string :title, null: false
      t.text   :content, null: false
      t.integer :importance
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
