class RenameClientsToClientsProfiles < ActiveRecord::Migration[5.2]
  def change
    rename_table :clients, :clients_profiles
  end
end
