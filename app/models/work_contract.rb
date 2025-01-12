class WorkContract < ApplicationRecord
  belongs_to :work
  belongs_to :contract

  validates :work_id, presence: true
  validates :contract_id, presence: true
end