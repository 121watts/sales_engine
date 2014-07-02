require_relative 'test_helper'
require_relative '../lib/transaction'
require_relative '../lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test

  def setup
    @transactions = TransactionRepository.new('./test/fixtures/small_transactions.csv')
  end

  def test_it_returns_empty_array_if_nothing_is_found
    numbers = @transactions.find_by_credit_card_number("12345678910")
    assert_equal [], numbers
  end

  def test_it_finds_credit_card_numbers
    numbers = @transactions.find_by_credit_card_number("4654405418249632")
    assert numbers.count >= 1
  end

  def test_it_finds_by_id_only_one_id
    id = @transactions.find_by_id("6")
    assert_equal 1, id.count
  end

  def test_it_finds_all_by_result
    results = @transactions.find_all_by_result("success")
    assert results.count >= 6
  end
end
