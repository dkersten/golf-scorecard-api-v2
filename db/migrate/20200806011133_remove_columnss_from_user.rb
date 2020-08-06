class RemoveColumnssFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :email
    remove_column :users, :password_digest
  end
end
