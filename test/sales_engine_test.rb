require_relative 'test_helper'
require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test

  def fixture_csv_dir
    File.expand_path '../fixtures', __FILE__
  end


end
