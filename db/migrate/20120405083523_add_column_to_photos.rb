class AddColumnToPhotos < ActiveRecord::Migration
  def up
    add_column :photos, :label, :string
    add_column :photos, :note, :string
  end

  def down
    remove_column :photos, :label
    remove_column :photos, :note
  end
end
