class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.integer :album_id, null:false
      t.string :song, null:false
      t.integer :ord, null:false
      t.text :lyrics, allow_nil:true
      t.string :band_id, null:false
      t.boolean :bonus

      t.index :song
      t.timestamps
    end
  end
end
