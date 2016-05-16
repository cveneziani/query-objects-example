require 'rails_helper'

describe 'ArtistQuery' do
  subject(:query) { ArtistQuery.new.all }

  let(:awesome_label)   { Label.create!(name: "Awesome Records") }
  let(:flawless_label)  { Label.create!(name: "Flawless-R") }

  let(:opeth)          { Artist.create!(name: "Opeth",          genre: "Metal",       available: true,  label: awesome_label) }
  let(:iron_maiden)    { Artist.create!(name: "Iron Maiden",    genre: "Metal",       available: false, label: awesome_label) }
  let(:daft_punk)      { Artist.create!(name: "Daft Punk",      genre: "Electronics", available: true,  label: flawless_label) }
  let(:britney_spears) { Artist.create!(name: "Britney Spears", genre: "Pop",         available: false, label: flawless_label) }

  let!(:artists) do
    [opeth, iron_maiden, daft_punk, britney_spears]
  end

  describe '#all' do
    it 'returns all artists' do
      expect(query.all).to eq(artists)
    end
  end

  describe '#available' do
    let(:expected_artists) do
      [opeth, daft_punk]
    end

    it 'returns only available artists' do
      expect(query.available).to eq(expected_artists)
    end
  end

  describe '#by_genre' do
    let(:expected_artists) do
      [opeth, iron_maiden]
    end

    it 'returns only artists matching given genre' do
      expect(query.by_genre('Metal')).to eq(expected_artists)
    end
  end

  describe '[chaining] #available and #by_genre' do
    let(:expected_artists) do
      [opeth]
    end

    it 'returns only available artists matching given genre' do
      expect(query.available.by_genre('Metal')).to eq(expected_artists)
    end
  end

  describe '[associations] available artists belonging to a given label' do
    subject(:query) { ArtistQuery.new(awesome_label.artists).all }

    let(:expected_artists) do
      [opeth]
    end

    it 'returns only available artists for the label' do
      expect(query.available).to eq(expected_artists)
    end
  end
end
