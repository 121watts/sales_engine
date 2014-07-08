require_relative 'test_helper'
require_relative '../lib/customer'

class CustomerTest < Minitest::Test

  def data
    {
      id:         '1',
      first_name: 'Duder',
      last_name:  'McDuff',
      created_at: '2012-03-27 14:54:09 UTC',
      updated_at: '2012-03-27 14:54:09 UTC'
    }
  end

  def test_it_has_attributes
    customer = Customer.new(data)
    assert data[:id],         customer.id
    assert data[:first_name], customer.first_name
    assert data[:last_name],  customer.last_name
    assert data[:created_at], customer.created_at
    assert data[:updated_at], customer.updated_at
  end

  def test_it_can_read_invoices
    customer = Customer.new(data)
    p customer.invoices
  end

end
