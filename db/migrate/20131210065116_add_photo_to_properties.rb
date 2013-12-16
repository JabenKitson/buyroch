class AddPhotoToProperties < ActiveRecord::Migration
  def self.up
    add_attachment :properties, :photo
  end

  def self.down
    remove_attachment :properties, :photo
  end
end
