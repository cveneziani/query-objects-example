class BaseQuery
  @model = nil

  attr_reader :relation

  def initialize(relation=nil)
    relation  = self.class.model.all unless relation
    @relation = relation.extending(self.class::Scopes)
  end

  def self.model
    @model
  end

  def self.all(relation=nil)
    query = new(relation)
    query.relation
  end

  def all
    self.relation
  end

  module Scopes
    # any new scope should be implemented there.
  end
end
