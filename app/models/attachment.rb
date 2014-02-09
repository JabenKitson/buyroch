class Attachment < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true
  has_attached_file :picture, :styles => { :medium => "400x400>", :thumb => "100x100>", :map => "50X50"}, :default_url => "/images/:style/missing.png"	

end