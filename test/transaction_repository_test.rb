require_relative 'test_helper'
require_relative '../lib/transaction'
require_relative '../lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test

  def setup
    @transactions = TransactionRepository.new('./test/fixtures/transactions.csv')
  end

  def test_it_returns_empty_array_if_nothing_is_found
    numbers = @transactions.find_all_by_credit_card_number("12345678910")
    assert_equal [], numbers
  end

  def test_it_returns_a_random_transaction
    transaction1 = @transactions.random
    transaction2 = @transactions.random
    assert transaction1 != transaction2
  end

  def test_it_returns_all_transactions
    transactions = @transactions.all
    assert transactions.count >= 199
  end

  def test_it_returns_all_transactions_by_result
    failed_transactions = @transactions.find_all_by_result("failed")
    assert failed_transactions.count >=29
    successful_transactions = @transactions.find_all_by_result("success")
    assert successful_transactions.count >= 170
  end

  def test_it_finds_a_specific_transaction_by_a_credit_card_number
    transaction = @transactions.find_by_credit_card_number("4203696133194408")
    assert_equal 6, transaction.id
  end

  def test_it_takes_id_as_integer_and_retruns_integer_for_ids
    transaction = @transactions.find_by_id(1)
    assert_equal 1, transaction.id
    assert_equal 1, transaction.invoice_id
  end
end
