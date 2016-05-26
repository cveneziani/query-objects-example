require 'rails_helper'
require 'support/shared_examples/query_object'

describe 'Extending::ArtistQuery' do
  subject(:query)             { Extending::ArtistQuery.relation }
  subject(:association_query) { Extending::ArtistQuery.relation(awesome_label.artists) }

  it_behaves_like 'query object - base'
  it_behaves_like 'query object - chaining with AR contidions in between'
end
