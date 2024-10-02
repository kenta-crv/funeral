class AddColumnToWork2 < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :pr, :string #PR
    add_column :works, :qualification, :string #資格
    add_column :works, :image, :string #PDF
  end
end
