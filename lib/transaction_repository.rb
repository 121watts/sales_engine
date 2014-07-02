require 'csv'
require_relative 'transaction'
require_relative 'repository'

class TransactionRepository < Repository

  def find_by_credit_card_number(credit_card_number)
    @objects.select { |transaction| transaction.credit_card_number == credit_card_number }
  end

  def find_by_id(id)
    @objects.select { |transaction| transaction.id == id }
  end

  def find_all_by_result(result)
    @objects.select { |transaction| transaction.result == result}
  end

end
