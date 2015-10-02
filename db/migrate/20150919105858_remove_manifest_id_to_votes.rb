class RemoveManifestIdToVotes < ActiveRecord::Migration
  def change
    remove_column :votes, :manifest_id, :string
  end
end
