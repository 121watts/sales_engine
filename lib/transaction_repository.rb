require 'csv'
require_relative 'transaction'

class TransactionRepository
  attr_reader :transactions

  def load(filename)
    @csv = CSV.open(filename, headers: true, header_converters: :symbol)
  end

  def build_transactions
    @transactions = @csv.collect do |row|
      Transaction.new(row)
    end
  end
end
