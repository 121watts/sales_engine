require_relative 'test_helper'
require_relative '../lib/merchant'

class MerchantTest < Minitest::Test

  def data
     {
    id:  '1',
    name: 'Your Mom',
    created_at: '2012-03-27 14:53:59 UTC',
    updated_at: '2012-03-27 14:53:59 UTC'
    }
  end

  def test_it_has_attributes
    merchant = Merchant.new(data)
    assert data[:id], merchant.id
    assert data[:name], merchant.name
    assert data[:created_at], merchant.created_at
    assert data[:updated_at], merchant.updated_at
  end

end
