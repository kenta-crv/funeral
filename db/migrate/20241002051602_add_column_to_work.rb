class AddColumnToWork < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :gender, :string #性別
    add_column :works, :age, :string #年齢
    add_column :works, :education, :string #学歴
    add_column :works, :histroy, :string #職務経歴
    add_column :works, :work_now, :string #現在の仕事
    add_column :works, :engineer_level, :string #エンジニアレベル
    add_column :works, :nationality, :string #国籍
    add_column :works, :japanese_level, :string #日本語レベル
    add_column :works, :conversion, :string #成果報酬
    add_column :works, :visa, :string #what king of visa
    add_column :works, :hope, :string #その他希望
    add_column :works, :recommendation, :string #推薦
  end
end
