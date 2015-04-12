class AddAttachmentToolImageToTools < ActiveRecord::Migration
  def self.up
    change_table :tools do |t|
      t.attachment :tool_image
    end
  end

  def self.down
    remove_attachment :tools, :tool_image
  end
end
