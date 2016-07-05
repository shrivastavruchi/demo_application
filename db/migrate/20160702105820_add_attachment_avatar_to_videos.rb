class AddAttachmentAvatarToVideos < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :videos, :avatar
  end
end
