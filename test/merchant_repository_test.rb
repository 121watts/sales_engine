require_relative 'test_helper'
require_relative '../lib/merchant_repository'

class  MerchantRepositoryTest<Minitest::Test

  def setup
    @merchants = MerchantRepository.new('./test/fixtures/merchants.csv')
  end

  def test_if_nothing_is_found_empty_array_is_returned
    names = @merchants.find_all_by_name("Your Mom is Lame")
    assert_equal [], names
  end

  def test_find_all_merchants_by_name
    names = @merchants.find_all_by_name("Williamson Group")
    assert names.count >= 2
  end

  def test_find_all_merchants_with_dirty_data
    names = @merchants.find_all_by_name("Klein, Rempel and Jones")
    assert names.count >= 1
  end

  def test_find_by_name_returns_first_instance
    merchant = @merchants.find_by_name("Williamson Group")
    assert_equal "2012-03-27 14:53:59 UTC", merchant.created_at
  end

  def test_find_by_id_takes_integers_and_returns_integers
    merchant = @merchants.find_by_id(9)
    assert_equal 9, merchant.id
  end

  def test_randomness
    merchant1 = @merchants.random
    merchant2 = @merchants.random

    assert merchant1 != merchant2
  end

  def test_can_find_multiple_records
    named_merchants = @merchants.find_all_by_name "Williamson Group"
    assert_equal 2, named_merchants.count
  end

end
