class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, required: true, null: false
      t.string :description, required: true, null: false
      t.string :photo_url, required: true, null: false
      t.integer :price_in_cents, required: true, null: false
      
      t.timestamps
    end
  end
end
