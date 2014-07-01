require_relative 'test_helper'
require_relative '../lib/merchant_repository'

class  MerchantRepositoryTest<Minitest::Test

#startup engine?
#loader class?
#one to many?

  def setup
    @merchants = MerchantRepository.new
    @merchants.load('./test/fixtures/small_merchants.csv')
  end


  def test_merchant_instance_exists
    assert MerchantRepository
  end

  def test_it_builds_merchants
    built = @merchants.build_merchants
    assert built.count >= 10
  end

  def test_if_nothing_is_found_empty_array_is_returned
    names = @merchants.find_by_name("Your Mom is Lame")
    assert_equal [], names
  end

  def test_find_merchants_by_name
    names = @merchants.find_by_name("Williamson Group")
    assert names.count >= 2
  end

  def test_find_merchants_with_dirty_data
    names = @merchants.find_all_by_name("Klein, Rempel and Jones")
    assert names.count >= 1
  end

end
