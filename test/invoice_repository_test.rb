require_relative 'test_helper'
require_relative '../lib/invoice'
require_relative '../lib/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test

  def setup
    @invoices = InvoiceRepository.new('./test/fixtures/small_invoices.csv')
  end

  def test_it_builds_invoices
    shipped_invoices = @invoices.find_all_by_status("shipped")
    assert shipped_invoices.count >= 7
  end
end
