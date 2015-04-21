class AddColumnArchivoToAttachments < ActiveRecord::Migration
  def self.up
    change_table :attachments do |t|
      t.attachment :archivo
    end
  end
  def self.down
    remove_attachment :attachments, :archivo
  end
end
