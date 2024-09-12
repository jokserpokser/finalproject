class TransactionItem < ApplicationRecord
    belongs_to :transaction_record, class_name: 'Transaction'
end
  
  