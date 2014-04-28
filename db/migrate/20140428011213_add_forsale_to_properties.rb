class AddForsaleToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :forsale, :boolean
  end
end
