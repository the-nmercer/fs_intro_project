class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.string :image_url
      t.references :sub_breed, foreign_key: true
      t.string :breed

      t.timestamps
    end
  end
end
