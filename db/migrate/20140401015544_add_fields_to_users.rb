class AddFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :facebook_url, :string
    add_column :users, :linked_in_url, :string
    add_column :users, :twitter_name, :string
    add_column :users, :phone, :string
    add_column :users, :org_id, :integer
  end
end
