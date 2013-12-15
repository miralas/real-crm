class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.belongs_to :account
      t.belongs_to :user
      t.string :action
      t.string :obj_name
      t.string :obj_link

      t.timestamps
    end
  end
end
