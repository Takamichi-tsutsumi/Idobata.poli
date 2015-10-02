class AddPublicManifestIdToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :public_manifest_id, :integer
  end
end
