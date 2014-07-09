require_relative 'test_helper'
require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test

  def fixture_csv_dir
    File.expand_path '../fixtures', __FILE__
  end

  attr_reader :engine

  # TODO: Do these go here?
  def test_randomness
    engine = SalesEngine.new(fixture_csv_dir)
    engine.startup
    merchant1 = engine.merchant_repository.random
    merchant2 = engine.merchant_repository.random

    assert merchant1 != merchant2
  end

  def test_can_find_multiple_records
    engine = SalesEngine.new(fixture_csv_dir)
    engine.startup
    merchants = engine.merchant_repository.find_all_by_name "Williamson Group"
    assert_equal 2, merchants.count
  end
end
