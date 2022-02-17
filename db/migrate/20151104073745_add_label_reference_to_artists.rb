class AddLabelReferenceToArtists < ActiveRecord::Migration[5.1]
  def change
    add_reference :artists, :label, index: true, foreign_key: true
  end
end
