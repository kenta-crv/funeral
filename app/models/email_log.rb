class EmailLog < ApplicationRecord
  belongs_to :work
  belongs_to :contract
end
