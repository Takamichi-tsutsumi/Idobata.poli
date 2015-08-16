class CreatePoliticalParties < ActiveRecord::Migration
  def change
    create_table :political_parties do |t|
      t.string :name
      t.text :detail

      t.timestamps null: false
    end
  end
end
