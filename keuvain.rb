class Artists::AvailableQuery
  def initialize(relation=Artist.all)
    @relation = relation
  end

  def call
    relation.where(available: true)
  end
end

class Artists::ByGenre
  def initialize(relation=Artist.all)
    @relation = relation
  end

  def call(genre)
    relation.where(genre: genre)
  end
end

class Artists::AvailableByGenre
  def initialize(relation=Artist.all)
    @relation = relation
  end

  def call(genre)
    available_artists = Artists::AvailableQuery.call
    Artists::ByGenre.new(available_artists).call(genre)
  end
end

available_artists = Artists::AvailableByGenreQuery.new.call("Rock")
