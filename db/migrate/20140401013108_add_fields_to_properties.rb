class AddFieldsToProperties < ActiveRecord::Migration
  def change
  	add_column :properties, :unique_space , :boolean
  	add_column :properties, :price_unit , :string
  	add_column :properties, :lease , :boolean
  	add_column :properties, :sqrft , :integer
  end
end
