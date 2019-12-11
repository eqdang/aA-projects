class ChangeArtworkSharesJoinTable < ActiveRecord::Migration[5.2]
  def change
    change_table :users, :artworks do |t|
      t.rename_table :artwork_shares
    end
  end
end
