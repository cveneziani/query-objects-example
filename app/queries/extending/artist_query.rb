module Extending
  # Part 2 - With refactoring
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

  #   def initialize(base_relation=nil)
  #     base_relation = Artist.all unless base_relation
  #     @relation     = base_relation.extending(Scopes)
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
