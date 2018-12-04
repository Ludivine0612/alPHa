class RenameCompanyToCompanyProfile < ActiveRecord::Migration[5.2]
  def change
    rename_table :companies, :companies_profiles
  end
end
