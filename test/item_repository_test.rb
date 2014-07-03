require_relative 'test_helper'
require_relative '../lib/item'
require_relative '../lib/item_repository'

class ItemRepositoryTest < Minitest::Test

  def setup
    @items = ItemRepository.new('./test/fixtures/small_items.csv')
  end

  def test_it_returns_empty_array_if_nothing_is_found
    collection = @items.find_all_by_name("Smootchie Bootcies")
    assert_equal [], collection
  end

  def test_it_finds_all_by_name
    collection = @items.find_all_by_name("Item Qui Esse")
    assert collection.count >= 1
  end

  def test_it_find_first_item_and_only_first_item
    one_item = @items.find_by_name("Item Qui Esse")
    assert_equal 1, one_item.id
  end

  def test_it_finds_first_one_by_merchant_id_by_integer
    one_item = @items.find_by_merchant_id(1)
    assert_equal "75107", one_item.unit_price
  end

  def test_it_takes_integers_and_returns_integers_for_ids
    one_item = @items.find_by_id(1)
    assert_equal 1, one_item.id
    assert_equal 1, one_item.merchant_id
  end

end
