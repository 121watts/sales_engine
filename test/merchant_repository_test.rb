require_relative 'test_helper'
require_relative '../lib/merchant_repository'


class  MerchantRepositoryTest<Minitest::Test

  def merchant_repository
    MerchantRepository.new
  end

  def test_merchant_instance_exists
    assert merchant_repository
  end

  def test_has_merchants
    merchants = MerchantRepository.new
    merchants.load(filename = 'test/fixtures/small_merchants.csv')
    names = merchants.find_by_name("Williamson Group")
    assert_equal 2, names.count
  end

end
