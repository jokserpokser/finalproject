class Admin::TransactionsController < ApplicationController
    before_action :authenticate_user!

    def index
        @transactions = Transaction.all
        @transaction_items = TransactionItem.all
    end
end
