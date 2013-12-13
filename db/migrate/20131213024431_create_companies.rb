class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :site
      t.text :adress
      t.integer :responsible
      t.belongs_to :account
      t.belongs_to :contact
      t.text :notes

      t.timestamps
    end
  end
end
