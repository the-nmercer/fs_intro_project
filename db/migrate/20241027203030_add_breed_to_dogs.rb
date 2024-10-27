class AddBreedToDogs < ActiveRecord::Migration[7.2]
  def change
    add_column :dogs, :breed, :string
  end
end
