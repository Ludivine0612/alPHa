class RenameEmployeesToEmployeesProfiles < ActiveRecord::Migration[5.2]
  def change
    rename_table :employees, :employees_profiles
  end
end
