class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id, foreign_key: true, presence: true
      t.integer :artwork_id, foreign_key: true, presence: true
      t.text :body, presence: true

      t.timestamp
      t.index :user_id
      t.index :artwork_id
      t.index :body
    end
  end
end
