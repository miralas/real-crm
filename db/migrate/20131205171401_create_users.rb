class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.belongs_to :account 
      t.belongs_to :role
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :surname
      t.string :mobile_phone
      t.string :work_phone
      t.text :notes

      t.timestamps
    end
  end
end
