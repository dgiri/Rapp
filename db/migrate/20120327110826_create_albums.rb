class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
