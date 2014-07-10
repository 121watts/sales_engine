require_relative 'merchant'

class MerchantRepository < Repository

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

end
