# Part 3 - Without extending
class ArtistQuery < BaseQuery
  def available
    where(available: true)
  end

  def by_genre(genre)
    where(genre: genre)
  end
end
