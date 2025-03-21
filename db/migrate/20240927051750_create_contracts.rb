class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.string :name #申込者様姓
      t.string :tel #電話番号
      t.string :address #住所
      t.string :email #メールアドレス
      t.string :fenural #葬儀の最安値
      t.string :firty_nine #四九日の最安値
      t.string :each_submit #死亡届の提出
      t.string :each_cancel #保険や年金の解約
      t.string :card_cancel #銀行口座やカードの解約
      t.string :hope_contact #参列者への参加依頼連絡
      t.string :inheritance #相続の法的対応
      t.string :tidying_up #片付け対応
      t.string :situation #ご状況
      t.timestamps
    end
  end
end
