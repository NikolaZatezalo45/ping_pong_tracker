class Player < ApplicationRecord
  has_many :matches
  validates :name, presence: true
end
