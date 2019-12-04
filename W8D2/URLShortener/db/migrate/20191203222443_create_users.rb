class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.timestamps
      t.index(:email)
    end
  end
end

# t.index([:branch_id, :party_id], unique: true, name: 'by_branch_party')
# https://apidock.com/rails/ActiveRecord/ConnectionAdapters/Table/index