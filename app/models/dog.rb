class Dog < ApplicationRecord
  belongs_to :owner
  belongs_to :sub_breed, optional: true

  validates :breed, presence: true, length: { maximum: 50 }
  validates :image_url, presence: true
end
