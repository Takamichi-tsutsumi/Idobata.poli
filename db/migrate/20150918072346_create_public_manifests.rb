class CreatePublicManifests < ActiveRecord::Migration
  def change
    create_table :public_manifests do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
