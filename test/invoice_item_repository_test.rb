require_relative 'test_helper'
require_relative '../lib/invoice_item_repository'
require_relative '../lib/invoice_items'

class  InvoiceItemRepositoryTest<Minitest::Test

  def setup
    @invoice_items = InvoiceItemRepository.new('test/fixtures/invoice_items.csv')
  end

  def test_it_returns_empty_array_if_nothing_is_found
    quantity = @invoice_items.find_all_by_quantity(100000)
    assert_equal [], quantity
  end

  def test_it_returns_a_random_invoice_item
    invoice_item1 = @invoice_items.random
    invoice_item2 = @invoice_items.random
    assert invoice_item1 != invoice_item2
  end

  def test_it_returns_all_invoice_items
    all_invoice_items = @invoice_items.all
    assert all_invoice_items.count > 150
  end

  def test_it_returns_all_items_by_invoice_id
    collection = @invoice_items.find_all_by_invoice_id(3)
    assert collection.count > 7
  end

  def test_it_returns_a_single_invoice_item
    invoice_item = @invoice_items.find_by_id(1)
    assert_equal 539, invoice_item.item_id
  end
end
#
#   def test_it_converts_unit_price_to_big_decimal
#     item = @items.find_by_name("Item Nemo Facere")
#     assert_equal 0.4291E2, item.unit_price
#   end
#
#   def test_it_returns_an_item_by_a_specific_unit_price
#     item = @items.find_by_unit_price(0.69338E3)
#     assert_equal "Item Dolorem Et", item.name
#   end
