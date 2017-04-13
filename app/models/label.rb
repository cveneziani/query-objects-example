class Label < ActiveRecord::Base
  has_many :artists, dependent: :destroy
end
