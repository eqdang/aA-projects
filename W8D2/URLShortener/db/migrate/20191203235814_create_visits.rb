class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.integer :user_id
      t.integer :shortened_url_id
      t.index(:user_id)
      t.index(:shortened_url_id)
      t.timestamps
    end
  end
end
