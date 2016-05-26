require 'support/shared_contexts/query_object_models'

RSpec.shared_examples 'query object - base' do
  include_context 'query object models'

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

  describe '[associations] available artists belonging to a given label' do
    let(:expected_artists) do
      [opeth]
    end

    it 'returns only available artists for the label' do
      expect(association_query.available).to eq(expected_artists)
    end
  end

  describe '[chaining] scopes from the query object: #available and #by_genre' do
    let(:expected_artists) do
      [opeth]
    end

    it 'returns only available artists matching given genre' do
      expect(query.available.by_genre('Metal')).to eq(expected_artists)
    end
  end

  describe '[chaining] with ActiveRecord conditions: available sorted by name' do
    let(:expected_artists) do
      [daft_punk, opeth]
    end

    it 'returns only available artists and sorted by name' do
      expect(query.available.order(:name)).to eq(expected_artists)
    end
  end
end
