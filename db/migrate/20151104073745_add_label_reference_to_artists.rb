class AddLabelReferenceToArtists < ActiveRecord::Migration
  def change
    add_reference :artists, :label, index: true, foreign_key: true
  end
end
