class CreatePlannings < ActiveRecord::Migration[5.2]
  def change
    create_table :plannings do |t|
      t.date :started
      t.date :ended
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
