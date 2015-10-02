class ChangeNotnullToPublicManifest < ActiveRecord::Migration
  def change
  	def up
  		change_column_null :public_manifests, :category_id, :null => false
  	end
  end
end
