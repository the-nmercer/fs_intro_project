class Dog < ApplicationRecord
  belongs_to :sub_breed, optional: true
end
