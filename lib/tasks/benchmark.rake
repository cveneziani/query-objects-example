desc 'Benchmark query object implementations'
task benchmark: :environment do
  Benchmark.ips do |x|
    x.report('delegator -- without model')  { ArtistQuery.relation }
    x.report('delegator -- with model')     { ArtistQuery.relation(Artist.all) }
    x.report('extend -- without model')     { ArtistQueryExtending.new.all }
    x.report('extend -- with model')        { ArtistQueryExtending.new(Artist.all).all }

    x.compare!
  end
end
