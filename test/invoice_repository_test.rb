require_relative 'test_helper'
require_relative '../lib/invoice'
require_relative '../lib/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test

  def setup
    @invoices = InvoiceRepository.new('./test/fixtures/invoices.csv')
  end

  def test_it_builds_and_finds_invoices
    shipped_invoices = @invoices.find_all_by_status("shipped")
    assert shipped_invoices.count >= 7
  end

  def test_it_finds_first_invoice
    invoice = @invoices.find_by_status("shipped")
    assert_equal 1, invoice.id
  end

  def test_it_takes_integers_and_returns_integers_for_ids
    invoice = @invoices.find_by_id(4)
    assert_equal 4, invoice.id
    assert_equal 1, invoice.customer_id
    assert_equal 33, invoice.merchant_id
  end

end
