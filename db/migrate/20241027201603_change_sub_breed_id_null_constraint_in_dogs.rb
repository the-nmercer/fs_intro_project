class ChangeSubBreedIdNullConstraintInDogs < ActiveRecord::Migration[6.1]
  def change
    change_column_null :dogs, :sub_breed_id, true
  end
end
