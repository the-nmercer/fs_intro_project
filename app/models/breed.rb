class Breed < ApplicationRecord
  has_many :sub_breeds
  has_many :dogs

  validates :name, presence: true, length: { maximum: 50 }
end
