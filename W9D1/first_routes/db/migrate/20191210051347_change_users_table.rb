class ChangeUsersTable < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.remove :name, :email
      t.column :username, :string, unique: true, presence: true
    end
  end
end
