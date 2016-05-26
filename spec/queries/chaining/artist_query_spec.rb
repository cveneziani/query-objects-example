require 'rails_helper'
require 'support/shared_examples/query_object'

describe 'Chaining::ArtistQuery' do
  subject(:query)             { Chaining::ArtistQuery.relation }
  subject(:association_query) { Chaining::ArtistQuery.relation(awesome_label.artists) }

  it_behaves_like 'query object - base'
  it_behaves_like 'query object - chaining with AR contidions in between'
end
