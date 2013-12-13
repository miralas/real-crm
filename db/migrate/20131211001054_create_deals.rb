class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :name
      t.string :status
      t.integer :budget
      t.integer :responsible
      t.text :notes
      t.integer :task
      t.belongs_to :account

      t.timestamps
    end
  end
end
