class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :type_of_task
      t.text :description
      t.datetime :date
      t.integer :responsible
      t.belongs_to :account
      t.belongs_to :contact
      t.belongs_to :company
      t.belongs_to :deal

      t.timestamps
    end
  end
end
