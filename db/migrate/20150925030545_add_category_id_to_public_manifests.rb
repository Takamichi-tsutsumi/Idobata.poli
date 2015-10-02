class AddCategoryIdToPublicManifests < ActiveRecord::Migration
  def change
    add_column :public_manifests, :category_id, :integer
  end
end
