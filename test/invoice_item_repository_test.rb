require_relative 'test_helper'
require_relative '../lib/invoice_item_repository'
require_relative '../lib/invoice_items'

class  InvoiceItemRepositoryTest<Minitest::Test

  def setup
    @invoice_items = InvoiceItemRepository.new('test/fixtures/small_invoice_items.csv')
  end

  def test_has_invoices
    invoice_ids = @invoice_items.find_all_by_invoice_id("1")
    assert invoice_ids.count > 2
  end

end
