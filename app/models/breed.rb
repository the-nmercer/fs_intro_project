class Breed < ApplicationRecord
  has_many :sub_breeds
  has_many :dogs
end
