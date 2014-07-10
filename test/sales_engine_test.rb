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

  def test_merchant_relationships_items
    merchant  = engine.merchant_repository.find_by_name("Klein, Rempel and Jones")
    item      = merchant.items.find { |item| item.name == 'Item Adipisci Sint' }
    assert                 merchant.items.count > 30
    assert_equal Merchant, item.merchant.class
  end

  def test_merchant_relationship_invoices
    merchant = engine.merchant_repository.find_by_id(1)
    invoice  = merchant.invoices.find { |invoice| invoice.id == 29 }
    assert                 merchant.invoices.count > 2
    assert_equal Merchant, invoice.merchant.class
  end

  def test_invoice_relationship_transactions
    invoice      = engine.invoice_repository.find_by_id(12)
    transactions = invoice.transactions
    assert                    transactions.count > 2
    assert_equal Transaction, transactions.first.class
  end

  def test_invoice_relationship_invoice_items
    invoice       = engine.invoice_repository.find_by_id(12)
    invoice_items = invoice.invoice_items
    assert                    invoice_items.count > 5
    assert_equal InvoiceItem, invoice_items.first.class
  end

  def test_invoice_relationship_item
    invoice = engine.invoice_repository.find_by_id(29)
    item    =  invoice.items.find { |x| x.name == 'Item Quo Magnam' }
    assert_equal Item, item.class
  end

  def test_invoice_relationship_customer
    invoice  = engine.invoice_repository.find_by_id(12)
    customer = invoice.customer
    assert_equal Customer, customer.class
    assert_equal "Mariah", customer.first_name
  end

  def test_invoice_relationship_merchant
    invoice  = engine.invoice_repository.find_by_id(4)
    merchant = invoice.merchant
    assert_equal Merchant,           merchant.class
    assert_equal "Quitzon and Sons", merchant.name
  end

  def test_invoice_item_relationship_invoice
    invoice_item = engine.invoice_item_repository.find_by_id(136)
    invoice      = invoice_item.invoice
    assert_equal Invoice,   invoice.class
    assert_equal "shipped", invoice.status
    assert_equal 29,        invoice.id
  end

  def test_invoice_item_relationship_item
    invoice_item = engine.invoice_item_repository.find_by_id(140)
    item         = invoice_item.item
    assert_equal  Item,               item.class
    assert_equal "Item Provident At", item.name
    assert_equal  6,                  item.id
  end

  def test_item_relationships_invoice_items
    item          = engine.item_repository.find_by_id(39)
    invoice_items = item.invoice_items
    assert                    invoice_items.count > 5
    assert_equal InvoiceItem, invoice_items.first.class
  end

  def test_item_relationships_merchant
    item     = engine.item_repository.find_by_id(40)
    merchant = item.merchant
    assert_equal Merchant,                  merchant.class
    assert_equal "Klein, Rempel and Jones", merchant.name
  end

  def test_customers_relationship_invoices
    customer = engine.customer_repository.find_by_last_name("Daugherty")
    invoice = customer.invoices.find { |invoice| invoice.id == 22 }
    assert                 customer.invoices.count > 7
    assert_equal Customer, invoice.customer.class
  end

  def test_transaction_invoice_relationships
    transaction = engine.transaction_repository.find_by_id(11)
    invoice     = transaction.invoice
    assert_equal Invoice, invoice.class
    assert_equal 12,      invoice.id
  end

end
