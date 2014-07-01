require_relative 'test_helper'
require_relative '../lib/invoice'
require_relative '../lib/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test

  def test_it_exists
    assert InvoiceRepository
  end

  def test_it_builds_invoices
    repo = InvoiceRepository.new
    repo.load('./test/fixtures/small_invoices.csv')
    repo.build_invoices
    assert_equal 10, repo.invoices.count
  end
end
