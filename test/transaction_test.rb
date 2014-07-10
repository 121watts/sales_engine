require_relative 'test_helper'
require_relative '../lib/transaction'

class TransactionTest < Minitest::Test

  def data
    {
      id:                         '1',
      invoice_id:                 '2',
      credit_card_number:         '4654405418249632',
      credit_card_expiration_date:'',
      result:                     'success',
      created_at:                 '2012-03-27 14:53:59 UTC',
      updated_at:                 '2012-03-27 14:53:59 UTC'
    }
  end

  def test_transaction_attributes
    transaction = Transaction.new(data)
    assert data[:id],                          transaction.id
    assert data[:invoice_id],                  transaction.invoice_id
    assert data[:credit_card_number],          transaction.credit_card_number
    assert data[:credit_card_expiration_date], transaction.credit_card_expiration_date
    assert data[:result],                      transaction.result
    assert data[:created_at],                  transaction.created_at
    assert data[:updated_at],                  transaction.updated_at
  end
end
