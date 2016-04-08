class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :genre
      t.boolean :available, default: true

      t.timestamps null: false
    end
  end
end
