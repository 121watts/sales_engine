require_relative 'test_helper'
require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test

  def fixture_csv_dir
    File.expand_path '../fixtures', __FILE__
  end

  def engine
    @engine ||= begin
      engine = SalesEngine.new(fixture_csv_dir)
      engine.startup
      engine
    end
  end

  def test_merchant_item_relationships
    merchant  = engine.merchant_repository.find_by_name("Klein, Rempel and Jones")
    assert merchant.items.count > 30
    item      = merchant.items.find { |item| item.name == 'Item Adipisci Sint' }
    assert_equal merchant, item.merchant
  end

  def test_customers_invoices_relationships
    customer = engine.customer_repository.find_by_last_name("Daugherty")
    assert customer.invoices.count > 7
    invoice = customer.invoices.find { |invoice| invoice.id == 22 }
    assert Customer, invoice.customer.class
  end

    #transaction invoices
  def test_transaction_invoice_relationships
    transaction = engine.transaction_repository.find_by_id(11)
    assert_equal Invoice, transaction.invoice.class
  end

  def test_invoice_item_relationship_test
    item = engine.item_repository.find_by_name("Item Accusamus Officia")
    assert_equal 1326, invoice.item_id
  end

  def test_includes_known_item
    item = engine.item_repository.find_by_name('Item Consequatur Eius')
    refute item.nil?
  end

  def test_merchant_invoices
    merchant = engine.merchant_repository.find_by_id(1)
    assert merchant.invoices.count > 2
    invoice = merchant.invoices.find { |invoice| invoice.id == 29 }
    assert_equal merchant, invoice.merchant
  end





end
