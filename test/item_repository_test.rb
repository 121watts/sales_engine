require_relative 'test_helper'
require_relative '../lib/item'
require_relative '../lib/item_repository'

class ItemRepositoryTest < Minitest::Test

  def setup
    @items = ItemRepository.new('./test/fixtures/items.csv')
  end

  def test_it_returns_empty_array_if_nothing_is_found
    item_name = @items.find_all_by_name("Nerf Guns")
    assert_equal [], item_name
  end

  def test_it_returns_a_random_item
    item1 = @items.random
    item2 = @items.random
    assert item1 != item2
  end

  def test_it_returns_all_items
    all_items = @items.all
    assert all_items.count > 40
  end

  def test_it_returns_all_items_by_name
    collection = @items.find_all_by_name("Item Qui Esse")
    assert collection.count >= 1
  end

  def test_it_returns_a_single_item
    item = @items.find_by_name("Item Qui Esse")
    assert_equal 1, item.id
  end

  def test_it_converts_unit_price_to_big_decimal
    item = @items.find_by_name("Item Nemo Facere")
    assert_equal 0.4291E2, item.unit_price
  end

  def test_it_finds_first_one_by_merchant_id
    one_item = @items.find_by_merchant_id(1)
    assert_equal 751.07, one_item.unit_price.to_f
  end

  def test_it_returns_an_item_by_a_specific_unit_price
    item = @items.find_by_unit_price(0.69338E3)
    assert_equal "Item Dolorem Et", item.name
  end

  def test_it_returns_all_items_by_a_specific_merchant_id
    ids = @items.find_all_by_merchant_id(1)
    assert ids.count > 10
  end
end
