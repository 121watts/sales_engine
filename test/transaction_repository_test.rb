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

  def test_it_finds_credit_card_numbers
    numbers = @transactions.find_all_by_credit_card_number("4654405418249632")
    assert numbers.count >= 1
  end

  def test_it_finds_only_one_id
    one_id = @transactions.find_by_result("failed")
    assert_equal 11, one_id.id
  end

  def test_it_finds_all_by_result
    results = @transactions.find_all_by_result("success")
    assert results.count >= 6
  end

  def test_it_takes_id_as_integer_and_retruns_integer_for_ids
    transaction = @transactions.find_by_id(1)
    assert_equal 1, transaction.id
    assert_equal 1, transaction.invoice_id
  end
  
end
