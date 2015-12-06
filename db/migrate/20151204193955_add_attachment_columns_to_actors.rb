class AddAttachmentColumnsToActors < ActiveRecord::Migration
  def up
    add_attachment :actors, :headshot
    add_attachment :actors, :resume
  end

  def down
    remove_attachment :actors, :headshot
    remove_attachment :actors, :resume
  end
end
