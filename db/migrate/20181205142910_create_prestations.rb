class CreatePrestations < ActiveRecord::Migration[5.2]
  def change
    create_table :prestations do |t|
      t.string :description
      t.references :activity, foreign_key: true
      t.references :booking, foreign_key: true
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
