class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :competence
      t.references :user, foreign_key: true
      t.references :service, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
