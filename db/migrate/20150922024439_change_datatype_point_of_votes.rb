class ChangeDatatypePointOfVotes < ActiveRecord::Migration
  def change
  	change_column :votes, :point, :integer
  end
end
