require_relative 'test_helper'
require_relative '../lib/customer_repository'

class  CustomerRepositoryTest<Minitest::Test

  def test_customer_instance_exists
    assert CustomerRepository
  end

  def test_it_builds_customers
    repo = CustomerRepository.new
    repo.load('./test/fixtures/small_customers.csv')
    repo.build_customers
    assert_equal 10, repo.customers.count
  end
end
