require_relative 'test_helper'
require_relative '../lib/invoice'
require_relative '../lib/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test

  def setup
    @invoices = InvoiceRepository.new('./test/fixtures/invoices.csv')
  end

  def test_it_returns_a_random_invoice
    invoice1 = @invoices.random
    invoice2 = @invoices.random
    assert invoice1 != invoice2
  end

  def test_it_returns_all_invoices
    all_invoices = @invoices.all
    assert all_invoices.count > 150
  end

  def test_it_finds_all_invoices_by_a_specific_customer_id
    ids = @invoices.find_all_by_customer_id(7)
    assert ids.count > 7
  end

  def test_it_finds_all_invoices_by_a_specific_merchant_id
    ids = @invoices.find_all_by_merchant_id(44)
    assert ids.count > 2
  end

  def test_it_returns_the_first_instance_when_finding_by_id
    invoice = @invoices.find_by_id(1)
    assert_equal 1, invoice.id
  end

  def test_it_returns_integers_for_ids
    invoice = @invoices.find_by_id(4)
    assert_equal 4, invoice.id
    assert_equal 1, invoice.customer_id
    assert_equal 33, invoice.merchant_id
  end
end
