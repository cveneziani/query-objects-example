module Chaining
  class ArtistQuery < Chaining::BaseQuery
    def self.relation(base_relation=nil)
      super(base_relation, Artist)
    end

    def available
      where(available: true)
    end

    def by_genre(genre)
      where(genre: genre)
    end
  end
end
