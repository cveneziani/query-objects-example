module Extending
  class BaseQuery
    @model = nil

    attr_reader :relation

    def initialize(base_relation=nil)
      base_relation = self.class.model.all unless base_relation
      @relation     = base_relation.extending(self.class::Scopes)
    end

    def self.model
      @model
    end

    def self.relation(base_relation=nil)
      query = new(base_relation)
      query.relation
    end

    module Scopes
      # any new scope should be implemented there.
    end
  end
end
