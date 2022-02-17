class AddPictureUrlToArtists < ActiveRecord::Migration[5.1]
  def change
    add_column :artists, :picture_url, :string
  end
end
