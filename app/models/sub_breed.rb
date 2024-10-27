class SubBreed < ApplicationRecord
  belongs_to :breed
  has_many :dogs
end
