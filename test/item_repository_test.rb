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
    collection = @items.find_all_by_name("Item Eos Et")
    assert collection.count >= 2
  end

  # def test_if_it_finds_only_one_instance_with_find_by_name
  #   collection = @items.find_by_name("Item Saepe Ipsum")
  #   assert_equal 1, array.count
  # end
end
