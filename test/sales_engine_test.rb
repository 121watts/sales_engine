require_relative 'test_helper'
require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test

    def test_merchant_randomness
      engine = SalesEngine.new
      engine.startup(true)

      merchant1 = engine.merchant_repository.random
      merchant2 = engine.merchant_repository.random

      assert merchant1 != merchant2
    end

    def test_can_find_multiple_records
      engine = SalesEngine.new
      engine.startup(true)

      merchants = engine.merchant_repository.find_all_by_name "Williamson Group"
      assert_equal 2, merchants.count
    end

    def test_merchant_relationships
      engine = SalesEngine.new
      engine.startup(true)

      merchant = engine.merchant_repository
      
    end

    # def test_invoice_relationships
    #   engine = SalesEngine.new
    #   engine.startup(true)
    #
    #   invoice = engine.invoice_repository.find_by_id(1)
    #   assert invoice.transaction == transaction
    #   invoice                       = engine.invoice_repository.find_by_id(1)
    #   assert invoice.transaction   == transaction
    # end
end
