class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :first_owner_id
      t.integer :second_owner_id
      t.integer :account_id

      t.timestamps
    end
  end
end
