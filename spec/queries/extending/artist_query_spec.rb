require 'rails_helper'
require 'support/shared_examples/query_object'

describe 'Extending::ArtistQuery' do
  subject(:query)             { Extending::ArtistQuery.new.all }
  subject(:association_query) { Extending::ArtistQuery.new(awesome_label.artists).all }

  it_behaves_like 'query object'
end
