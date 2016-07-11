class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, required: true, null: false
      t.string :first_name, required: true, null: false
      t.string :last_name, required: true, null: false
      t.string :encrypted_password, required: true, null: false
      
      t.timestamps
    end
  end
end
