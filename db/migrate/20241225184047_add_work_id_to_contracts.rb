class AddWorkIdToContracts < ActiveRecord::Migration[5.2]
  def change
    add_reference :contracts, :work, foreign_key: true
  end
end
