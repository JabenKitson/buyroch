class Property < ActiveRecord::Base
  validates :title, :presence => true
  validates :description, :presence => true
  validates :price, :presence => true
  validates :photo_file_name, :presence => true
  has_attached_file :photo, :styles => { :medium => "400x400>", :thumb => "100x100>", :map => "50X50"}, :default_url => "/images/:style/missing.png"	
  geocoded_by :address
  after_validation :geocode
  belongs_to :user
end
