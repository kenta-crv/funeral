class Contract < ApplicationRecord
    has_many :comments
    belongs_to :work, optional: true
    has_many :work_contracts
    has_many :works, through: :work_contracts
    def self.without_ng_status
        # 最新の進捗状況がNGでないWorkのみを返す
        where.not(id: Contract.joins(:comments)
                              .where(comments: { status: 'NG' }) # 複数形に修正
                              .group('contracts.id') # contractsテーブルを指定
                              .having('MAX(comments.created_at) < ?', Time.current))
      end
end
   