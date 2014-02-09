class AddLoopnetLoginToUsers < ActiveRecord::Migration
  def change
  	  add_column :users, :loopnet_logon, :string
      add_column :users, :loopnet_password, :string
      add_column :users, :mncar_logon, :string
      add_column :users, :mncar_password, :string
      add_column :users, :craigslist_logon, :string
      add_column :users, :craigslist_password, :string
  end
end
