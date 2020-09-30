class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :product_name
      t.text  :description 
      t.integer :category_id
      t.integer :condition_id
      t.integer :fee_id 
      t.integer :address_id 
      t.integer :days_id    
      t.integer :price    
      t.timestamps
    end
  end
end
