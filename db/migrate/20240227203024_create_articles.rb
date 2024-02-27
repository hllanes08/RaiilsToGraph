class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.float :price
      t.string :brand
      t.integer :stock

      t.timestamps
    end
  end
end
