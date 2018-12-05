class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.references :job, foreign_key: true
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
