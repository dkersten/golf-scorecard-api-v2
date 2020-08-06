class RemoveAuthFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :auth0ID
    add_column :users, :auth_id, :string

  end
end
