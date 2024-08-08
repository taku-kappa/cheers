class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :shop_name

      t.string :menu1_name
      t.integer :menu1_price
      t.text :menu1_description

      t.string :menu2_name
      t.integer :menu2_price
      t.text :menu2_description

      t.string :menu3_name
      t.integer :menu3_price
      t.text :menu3_description

      t.integer :user_id

      t.timestamps
    end
  end
end
