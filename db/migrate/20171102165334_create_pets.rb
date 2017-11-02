class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.references :user, foreing_key: true

      t.timestamps
    end
  end
end
