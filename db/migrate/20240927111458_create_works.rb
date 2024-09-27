class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :name  #フルネーム
      t.string :tel #電話番号
      t.string :address
      t.string :email #メールアドレス
      t.string :program_histroy #プログラム歴
      t.string :program_python #Python歴
      t.string :program_other #使用可能言語
      t.string :period #いつから働きたい
      t.string :remarks #要望
      t.timestamps
    end
  end
end
