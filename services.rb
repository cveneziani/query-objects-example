module Service
  extend ActiveSupport::Concern

  included do
    attr_reader :params
  end

  class_methods do
    def call(*args)
      new(*args).call
    end
  end

  def initialize(params = {})
    @params = params

    params.each do |key, value|
      next if respond_to?(key, true)

      define_singleton_method(key) { value }
    end
  end
end

module Groups
  class Create
    include Service

    def call
      #do_something
    end

  end
end




def call
  group = Group.new attributes
  contract = GroupContract.new(group)

  fail ValidationError.new(contract) unless contract.validate

  album.save
  album
end

@form = SongForm.new(Song.new)
So you need to know your entity. Where the initialization of the entity should be done on the service

At the end I return the album to avoid the true/false pb and when I create an object I like to have it in response.


def create
  Groups::Create.call attributes: group_attributes
rescue ValidationError
  render :new
end
