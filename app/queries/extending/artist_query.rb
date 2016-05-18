# Part 2 - With refactoring
module Extending
  class ArtistQuery < Extending::BaseQuery
    @model = Artist

    module Scopes
      def available
        where(available: true)
      end

      def by_genre(genre)
        where(genre: genre)
      end
    end
  end

  # # Part 1 - without refactoring
  # class ArtistQuery
  #   attr_reader :relation

  #   def initialize(relation=Artist.all)
  #     @relation = relation.extending(Scopes)
  #   end

  #   def all
  #     self.relation
  #   end

  #   module Scopes
  #     def available
  #       where(available: true)
  #     end

  #     def by_genre(genre)
  #       where(genre: genre)
  #     end
  #   end
  # end
end
