class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :skype
      t.string :post
      t.integer :responsible
      t.integer :account_id
      t.integer :company_id
      t.text :notes

      t.timestamps
    end
  end
end
