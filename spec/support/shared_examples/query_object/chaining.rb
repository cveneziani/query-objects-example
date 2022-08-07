require 'support/shared_contexts/query_object_models'

RSpec.shared_examples 'query object - chaining with AR contidions in between' do
  include_context 'query object models'

  describe '[chaining] with ActiveRecord conditions in between: sorted by name and available' do
    let(:expected_artists) do
      [daft_punk, opeth]
    end

    it 'returns only available artists and sorted by name' do
      expect(query.order(:name).available).to eq(expected_artists)
    end
  end
end

RSpec.shared_examples 'query object - not chaining with AR contidions in between' do
  include_context 'query object models'

  describe '[chaining] with ActiveRecord conditions in between: sorted by name and available' do
    let(:expected_artists) do
      [daft_punk, opeth]
    end

    it 'returns only available artists and sorted by name' do
      expect { query.order(:name).available }.to raise_error(NoMethodError, /undefined method `available' for #<ActiveRecord::Relation \[#<Artist/)
    end
  end
end
