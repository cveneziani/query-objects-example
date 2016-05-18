# Query Objects - Example

This is an example of a rails application that defines Query Objects.

## Getting started

Have a look at `app/queries/` folder.

2 implementations are provided:

* Delegating to ActiveRecord::Relation (default one)
* Extending ActiveRecord::Relation

## Usage

### Defining a Query Object

```ruby
class ArtistQuery < BaseQuery
  # defines the default model on which queries will be made
  def self.relation(base_relation=nil)
    super(base_relation, Artist)
  end

  # a first scope
  def available
    where(available: true)
  end

  # another scope
  def by_genre(genre)
    where(genre: genre)
  end
end
```

### Making queries

```ruby
ArtistQuery.relation
# =>  Returns all artists.
#     Based on `all` relation provided by `ActiveRecord`).

ArtistQuery.relation.available
# =>  Returns all available artists.
#     Based on `available` scope method provided by `ArtistQuery`.

ArtistQuery.relation.available.by_genre('Metal')
# =>  Returns all available Metal artists.
#     Based on `available` and `by_genre(name)` scope methods provided by `ArtistQuery`.

ArtistQuery.relation.available.by_genre('Metal').order(:name)
# =>  Returns all available metal artists ordered by name.
#     Based on `available` and `by_genre(name)` scope methods provided by `ArtistQuery`
#     and based on `order` method provided by `ActiveRecord`.

awesome_label = Label.first
ArtistQuery.relation(awesome_label.artists).available
# =>  Returns all available artists for awesome label.
#     Based on the following association: `label` has many `artists`.
```

## Tests

There are tests for the 2 implementations. To run the tests:

```
$ rspec
```

## Benchmark

A benchmark is provided between the 2 implementations: delegator and extend. Just run the following command:

```
$ rake benchmark
```

### Results

```
Warming up --------------------------------------
delegator -- without model 12.047k i/100ms
delegator -- with model    15.510k i/100ms
extend -- without model     8.431k i/100ms
extend -- with model        8.397k i/100ms
Calculating -------------------------------------
delegator -- without model 170.047k (± 3.8%) i/s -    855.337k in   5.037890s
delegator -- with model    169.862k (± 3.5%) i/s -    853.050k in   5.029212s
extend -- without model     77.498k (±12.7%) i/s -    379.395k in   5.009203s
extend -- with model        81.004k (±14.7%) i/s -    394.659k in   5.005465s

Comparison:
delegator -- without model: 170047.0 i/s
delegator -- with model:    169862.0 i/s - same-ish: difference falls within error
extend -- with model:        81004.4 i/s - 2.10x slower
extend -- without model:     77497.9 i/s - 2.19x slower
```

## Running the app

### Requirements

* Ruby 2.3+
* SQLite

### Installation

```
$ bundle install
$ rake db:create db:migrate
```
