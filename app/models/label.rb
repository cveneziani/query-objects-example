class Label < ApplicationRecord
  has_many :artists, dependent: :destroy
end
