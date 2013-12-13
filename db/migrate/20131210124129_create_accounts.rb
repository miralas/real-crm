class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :owner_id
      t.integer :max_deals
      t.integer :max_contacts

      t.timestamps
    end
  end
end
