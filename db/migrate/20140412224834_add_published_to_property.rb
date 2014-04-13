class AddPublishedToProperty < ActiveRecord::Migration
  def change
  	add_column :properties, :published, :boolean
  end
end
