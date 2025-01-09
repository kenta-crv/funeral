class CreateEmailLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :email_logs do |t|
      t.references :work, null: false
      t.references :contract, null: false
      t.datetime :sent_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      
      t.timestamps
    end
  end
end
