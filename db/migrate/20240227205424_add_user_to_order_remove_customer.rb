class AddUserToOrderRemoveCustomer < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :user_id, :integer
    remove_column :orders, :customer_id
  end
end
