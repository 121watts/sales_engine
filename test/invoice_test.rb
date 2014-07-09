require_relative 'test_helper'
require_relative '../lib/invoice'

class InvoiceTest < Minitest::Test


  def data
     {
      id: '1',
      customer_id: '2',
      merchant_id: '3',
      status: 'success',
      created_at: '2012-03-27 14:53:59 UTC',
      updated_at: '2012-03-27 14:53:59 UTC'
     }
  end

  def test_it_has_attributes
    invoice = Invoice.new(data)
    assert 1, invoice.id
    assert data[:customer_id], invoice.customer_id
    assert data[:merchant_id], invoice.merchant_id
    assert data[:status], invoice.status
    assert data[:created_at], invoice.created_at
    assert data[:updated_at], invoice.updated_at
  end

end
