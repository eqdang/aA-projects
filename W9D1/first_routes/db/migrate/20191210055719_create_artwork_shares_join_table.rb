class CreateArtworkSharesJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork_shares do |t|
      t.integer :viewer_id, presence: true
      t.integer :artwork_id, presence: true
      
      t.timestamps
      t.index :viewer_id
      t.index :artwork_id
      t.index [:artwork_id, :viewer_id], unique: true
    end
  end
end
