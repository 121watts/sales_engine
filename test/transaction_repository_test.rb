require_relative 'test_helper'
require_relative '../lib/transaction'
require_relative '../lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test

  def test_it_exists
    assert TransactionRepository
  end

  def test_it_builds_transactions
    repo = TransactionRepository.new
    repo.load('./test/fixtures/small_transactions.csv')
    repo.build_transactions
    assert_equal 9, repo.transactions.count
  end
end
