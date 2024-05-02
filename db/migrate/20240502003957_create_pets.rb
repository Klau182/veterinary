class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :specie
      t.integer :weight
      t.integer :height

      t.timestamps
    end
  end
end
