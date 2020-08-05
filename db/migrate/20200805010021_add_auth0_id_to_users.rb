class AddAuth0IdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :auth0ID, :string
  end
end
