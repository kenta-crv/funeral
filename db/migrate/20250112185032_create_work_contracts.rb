class CreateWorkContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :work_contracts do |t|
      t.references :work, null: false, foreign_key: true
      t.references :contract, null: false, foreign_key: true
      t.timestamps
    end
  end
end
