class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.string :agree #同意
      t.string :co #会社名
      t.string :president_first  #代表者姓
      t.string :president_last  #代表者名
      t.string :tel #電話番号
      t.string :address #ご住所住所
      t.string :url #会社HP
      t.string :recruit_url #採用ページ
      t.string :work #採用予定職種
      t.string :plan #ご利用プラン選択
      t.string :number #採用予定人数
      t.string :period #希望採用予定期日
      t.string :remarks #その他要望
      t.string :person_first  #採用担当姓
      t.string :person_last  #採用担当名
      t.string :person_tel #採用担当携帯番号
      t.string :email #採用担当メールアドレ
      t.string :memo
      t.string :person_email 
      t.string :recruit_url_2
      t.string :pdf
      t.string :post_title
      t.string :contract_date
      t.string :unit_price
      t.string :refund 
      t.timestamps
    end
  end
end
