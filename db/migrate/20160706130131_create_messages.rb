class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.integer :sender_id
    	t.integer :user_id
    	t.string  :message_box
      t.timestamps null: false
    end
  end
end
