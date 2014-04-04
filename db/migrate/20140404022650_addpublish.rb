class Addpublish < ActiveRecord::Migration
  def change
  		add_column :properties, :visible_on_buyroch, :boolean
  end
end
