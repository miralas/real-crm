class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :type
      t.text :description
      t.datetime :date
      t.integer :responsible
      t.integer :account_id
      t.integer :contact_id
      t.integer :company_id
      t.integer :deal_id

      t.timestamps
    end
  end
end
