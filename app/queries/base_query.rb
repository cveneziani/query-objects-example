require 'delegate'

class BaseQuery < SimpleDelegator
  def self.relation(base_relation, base_model)
    base_relation ||= base_model.all
    new(base_relation)
  end

  def self.method_added(method_name)
    return if @redefining
    @redefining = true

    alias_method :"_#{method_name}", method_name

    define_method method_name do |*args, &block|
      result = send(:"_#{method_name}", *args, &block)

      if result.class == __getobj__.class
        self.class.new(result)
      else
        result
      end
    end

    @redefining = false
  end
end
