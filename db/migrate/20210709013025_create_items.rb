class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,              null: false
      t.text    :text,              null: false
      t.integer :category_id,       null: false
      t.integer :status_id,         null: false
      t.integer :shipping_cost_id,  null: false
      t.integer :prefecture_id,     null: false
      t.integer :shipping_time_id,  null: false
      t.integer :selling_price,     null: false

      t.timestamps
    end
  end
end
