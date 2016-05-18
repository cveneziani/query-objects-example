desc 'Benchmark query object implementations'
task benchmark: :environment do
  Benchmark.ips do |x|
    x.report('delegator -- without model')  { ArtistQuery.relation }
    x.report('delegator -- with model')     { ArtistQuery.relation(Artist.all) }
    x.report('extend -- without model')     { Extending::ArtistQuery.new.all }
    x.report('extend -- with model')        { Extending::ArtistQuery.new(Artist.all).all }

    x.compare!
  end
end
