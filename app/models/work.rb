class Work < ApplicationRecord
  mount_uploader :image, ImagesUploader
  has_many :progresses
  def self.without_ng_status
    # 最新の進捗状況がNGでないWorkのみを返す
    where.not(id: Work.joins(:progresses)
                       .where(progresses: { status: 'NG' })
                       .group('works.id') # worksテーブルを指定
                       .having('MAX(progresses.created_at) < ?', Time.current))
  end
end