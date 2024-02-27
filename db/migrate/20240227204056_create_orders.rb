class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.integer :article_id
      t.integer :customer_id
      t.float :total
      t.integer :quantity

      t.timestamps
    end
  end
end
