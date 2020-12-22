class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.integer :band_id, null:false
      t.string :title, null:false
      t.float :year, null:false
      t.string :album_type, null:false 
      t.integer :album_id, null:false

      t.index :band_id
      t.index :title

      t.timestamps
    end
  end
end
