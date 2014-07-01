require_relative 'test_helper'
require_relative '../lib/invoice_item_repository'
require_relative '../lib/invoice_items'

class  InvoiceItemRepositoryTest<Minitest::Test

  # def filename
  #   @filename ||= File.absolute_path("../fixtures/small_invoice_items.csv", __FILE__)
  # end

  def invoice_item_repository
    InvoiceItemRepository.new
  end

  def test_invoice_item_repo_instance_exists
    assert invoice_item_repository
  end

  def test_has_invoices
    invoice_items = InvoiceItemRepository.new
    invoice_items.load(filename = 'test/fixtures/small_invoice_items.csv')
    invoice_ids = invoice_items.find_by_invoice_id("1")
    assert invoice_ids.count > 2
  end

end
