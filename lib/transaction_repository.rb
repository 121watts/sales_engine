require_relative 'transaction'
require_relative 'repository'

class TransactionRepository < Repository

  def inspect
    "#<#{self.class} #{@transactions.size} rows>"
  end

end
