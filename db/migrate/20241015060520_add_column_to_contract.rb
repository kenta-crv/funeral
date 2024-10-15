class AddColumnToContract < ActiveRecord::Migration[5.2]
  def change
    add_column :contracts, :payment, :string #支払日
    add_column :contracts, :salary, :string #給与
    add_column :contracts, :employment_conditions, :string #採用条件
    add_column :contracts, :document_screening, :string #書類選考期間
    add_column :contracts, :conversion, :string #採択率
  end
end
