class AddAttachmentPictureToAttachments < ActiveRecord::Migration
  def self.up
    change_table :attachments do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :attachments, :picture
  end
end
