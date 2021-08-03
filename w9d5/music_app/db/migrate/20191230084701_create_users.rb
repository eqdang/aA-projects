class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, nulL:false
      t.string :password_digest, nulL:false
      t.string :session_token, nulL:false
      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :session_token, unique: true
  end
end
