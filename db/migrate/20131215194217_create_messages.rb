class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.string :title
      t.text :message
      t.string :status
      t.belongs_to :conversation

      t.timestamps
    end
  end
end
