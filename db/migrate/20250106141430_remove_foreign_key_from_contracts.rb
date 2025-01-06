class RemoveForeignKeyFromContracts < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :contracts, :works
  end
end
