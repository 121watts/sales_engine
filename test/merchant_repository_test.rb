require_relative 'test_helper'
require_relative '../lib/merchant_repository'

class  MerchantRepositoryTest<Minitest::Test


  def test_merchant_instance_exists
    assert MerchantRepository
  end

  def test_it_builds_merchants
    repo = MerchantRepository.new
    repo.load('./test/fixtures/small_merchants.csv')
    repo.build_merchants
    assert_equal 10, repo.merchants.count
  end


  def test_has_merchants
    merchants = MerchantRepository.new
    merchants.load('./test/fixtures/small_merchants.csv')
    names = merchants.find_by_name("Williamson Group")
    assert_equal 2, names.count
  end

end
