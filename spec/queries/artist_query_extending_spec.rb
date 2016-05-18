require 'rails_helper'
require 'support/shared_examples/query_object'

describe 'ArtistQueryExtending' do
  subject(:query)             { ArtistQueryExtending.new.all }
  subject(:association_query) { ArtistQueryExtending.new(awesome_label.artists).all }

  it_behaves_like 'query object'
end
