class Owner < ApplicationRecord
  has_many :dogs

  validates :name, presence: true, length: { maximum: 50 }
end
