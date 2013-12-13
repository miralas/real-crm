class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :skype
      t.string :post
      t.integer :responsible
      t.belongs_to :account
      t.belongs_to :company
      t.text :notes

      t.timestamps
    end
  end
end
