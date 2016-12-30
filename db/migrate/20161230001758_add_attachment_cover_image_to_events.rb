class AddAttachmentCoverImageToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :cover_image
    end
  end

  def self.down
    remove_attachment :events, :cover_image
  end
end
