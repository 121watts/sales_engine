require_relative 'test_helper'
require_relative '../lib/item'
require_relative '../lib/item_repository'

class ItemRepositoryTest < Minitest::Test

  def test_it_exists
    assert ItemRepository
  end

  def test_it_builds_merchants
    repo = ItemRepository.new
    repo.load('./test/fixtures/small_items.csv')
    repo.build_items
    assert_equal 5, repo.items.count
  end
end
