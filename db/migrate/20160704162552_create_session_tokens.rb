class CreateSessionTokens < ActiveRecord::Migration
  def change
    create_table :session_tokens do |t|
      t.string :token, required: true, null: false
      t.integer :user_id, required: true, null: false
      t.boolean :active, required: true, null: false, default: true
      
      t.timestamps
    end
  end
end
