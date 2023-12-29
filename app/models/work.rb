class Work < ApplicationRecord
    validates :name, {presence: true}  #フルネーム
    validates :tel, {presence: true} #電話番号
    validates :address, {presence: true} #住所
    validates :email, {presence: true} #メールアドレス
    validates :program_histroy, {presence: true} #プログラム歴
    validates :program_python, {presence: true} #Python歴
    validates :program_other, {presence: true} #使用可能言語
    validates :period, {presence: true} #いつから働きたい
    validates :remarks, {presence: true} #要望
end
