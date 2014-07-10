require_relative 'test_helper'
require_relative '../lib/item'

class ItemTest < Minitest::Test

  def data
     {
      id:          '1',
      name:        'Super Shredder',
      description: 'It slices, it dices, it cuts through a boot!',
      unit_price:  '75107',
      merchant_id: '3',
      created_at:  '2012-03-27 14:53:59 UTC',
      updated_at:  '2012-03-27 14:53:59 UTC'
     }
  end

  def test_item_attributes
    item = Item.new(data)
    assert data[:id],          item.id
    assert data[:name],        item.name
    assert data[:description], item.description
    assert data[:unit_price],  item.unit_price
    assert data[:merchant_id], item.merchant_id
    assert data[:created_at],  item.created_at
    assert data[:updated_at],  item.updated_at
  end
end
