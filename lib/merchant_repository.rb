require_relative 'merchant'
require_relative 'repository'

class MerchantRepository < Repository

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

end
