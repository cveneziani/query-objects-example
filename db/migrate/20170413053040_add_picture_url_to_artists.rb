class AddPictureUrlToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :picture_url, :string
  end
end
