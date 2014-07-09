require_relative 'test_helper'
require_relative '../lib/customer_repository'

class  CustomerRepositoryTest<Minitest::Test

  def setup
    @customers = CustomerRepository.new('./test/fixtures/customers.csv')
  end

end
