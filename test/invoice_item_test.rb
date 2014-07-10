require_relative 'test_helper'
require_relative '../lib/invoice_items'

class InvoiceItemTest < Minitest::Test

  def data
    {
      id:         '1',
      item_id:    '529',
      invoice_id: '2',
      quantity:   '6',
      created_at: '2012-03-27 14:54:09 UTC',
      updated_at: '2012-03-27 14:54:09 UTC'
    }
  end

  def test_invoice_item_attributes
    invoice_items = InvoiceItem.new(data)
    assert_equal  1,                        invoice_items.id
    assert_equal  529,                      invoice_items.item_id
    assert_equal  2,                        invoice_items.invoice_id
    assert_equal  6,                        invoice_items.quantity
    assert_equal '2012-03-27 14:54:09 UTC', invoice_items.created_at
    assert_equal '2012-03-27 14:54:09 UTC', invoice_items.updated_at
  end

end
