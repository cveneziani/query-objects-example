require 'delegate'

module Chaining
  class BaseQuery < SimpleDelegator
    def self.relation(base_relation, base_model)
      base_relation ||= base_model.all
      new(base_relation)
    end

    def method_missing(method_name, *args, &block)
      result = super(method_name, *args, &block)

      if result.class == __getobj__.class
        self.class.new(result)
      else
        result
      end
    end
  end
end
