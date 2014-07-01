require 'csv'
require_relative 'repository'
#Check to see if I need this
require_relative 'transaction'

class TransactionRepository < Repository
    attr_reader :transactions

    def build_transactions
      @transactions = @csv.collect do |row|
        Transaction.new(row)
      end
    end
end
