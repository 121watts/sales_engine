require_relative 'test_helper'
require_relative '../lib/customer_repository'

class  CustomerRepositoryTest<Minitest::Test

  def setup
    @customers = CustomerRepository.new('./test/fixtures/customers.csv')
  end

  def test_it_returns_empty_array_if_nothing_is_found
    customer = @customers.find_all_by_last_name("Casimir")
    assert_equal [], customer
  end

  def test_it_returns_a_random_customer
    customer1 = @customers.random
    customer2 = @customers.random
    assert customer1 != customer2
  end

  def test_it_returns_all_customers
    customers = @customers.all
    assert customers.count > 199
  end

  def test_it_returns_all_customers_by_last_name
    last_names = @customers.find_all_by_last_name("Kirlin")
    assert last_names.count >= 2
  end

  def test_it_returns_a_single_customer_by_id
    customer = @customers.find_by_id(7)
    assert_equal "Parker", customer.first_name
  end

end
