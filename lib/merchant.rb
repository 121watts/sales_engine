class Merchant

  attr_reader :id,
              :name,
              :created_at,
              :updated_at

  attr_accessor :items,
                :invoices

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

  def initialize(data)
    @id         = data[:id].to_i
    @name       = data[:name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @items      = data[:items]
    @invoices   = data[:invoices]
  end

end
