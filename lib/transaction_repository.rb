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

  def find_by_credit_card_number(credit_card_number)
    build_transactions.select { |transaction| transaction.credit_card_number == credit_card_number }
  end

  def find_by_id(id)
    build_transactions.select { |transaction| transaction.id == id }
  end

  def find_all_by_result(result)
    build_transactions.select { |transaction| transaction.result == result}
  end

end
