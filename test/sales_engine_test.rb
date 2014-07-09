require_relative 'test_helper'
require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test

    attr_reader :engine

    def setup
      engine = SalesEngine.new(true)
      engine.startup
    end

    def test_merchant_randomness
      engine.startup
      merchant1 = engine.merchant_repository.random
      merchant2 = engine.merchant_repository.random

      assert merchant1 != merchant2
    end

    def test_can_find_multiple_records
      engine = SalesEngine.new(true)

      merchants = engine.merchant_repository.find_all_by_name "Williamson Group"
      assert_equal 2, merchants.count
    end

    def test_merchant_relationships
      engine = SalesEngine.new(true)
      merchants = engine.merchant_repository
      merchant  = merchants.find_by_name("Klein, Rempel and Jones")
      assert_equal 2, merchant.id
      items     = engine.item_repository.find_all_by_merchant_id(merchant.id)
      assert items.count > 30
    end

end
