class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :title, presence: true
      t.string :image_url, presence: true
      t.integer :artist_id, unique: true, presence: true

      t.timestamps
      t.index :artist_id 
      t.index :title
      t.index [:artist_id, :title], unique: true
    end
  end
end
