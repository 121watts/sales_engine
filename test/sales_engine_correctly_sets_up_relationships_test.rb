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

  def test_includes_known_item
    item = engine.item_repository.find_by_name('Item Consequatur Eius')
    refute item.nil?
  end

  def test_merchant_invoices
    invoices = engine.invoice_repository
    invoices.find_by_merchant_id()
  end

end
