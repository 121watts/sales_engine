require_relative 'test_helper'
require_relative '../lib/invoice_item_repository'
require_relative '../lib/invoice_items'

class  InvoiceItemRepositoryTest<Minitest::Test
    attr_reader :engine

  def setup
    @invoice_items = InvoiceItemRepository.new('test/fixtures/invoice_items.csv')
  end

  def test_it_takes_integer_and_returns_integer
    invoice_item = @invoice_items.find_by_id(10)
    assert_equal 1830, invoice_item.item_id
    assert_equal 2,    invoice_item.invoice_id
    assert_equal 4,    invoice_item.quantity
  end

  def test_it_finds_multiple_invoices
    invoice_items = @invoice_items.find_all_by_invoice_id(1)
    assert invoice_items.count >= 5
  end

  def test_it_finds_by_item_id
    invoice_item = @invoice_items.find_by_item_id(539)
    assert_equal 1, invoice_item.id
    assert_equal 1, invoice_item.invoice_id
    assert_equal 5, invoice_item.quantity
    assert_equal '13635', invoice_item.unit_price
  end

end
