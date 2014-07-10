require 'bigdecimal'

class Item
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at

  attr_accessor :item_id,
                :invoice_items,
                :merchant

  def inspect
    "#<#{self.class} #{@items.size} rows>"
  end

  def initialize(data)
    @id           = data[:id].to_i
    @name         = data[:name]
    @description  = data[:description]
    @unit_price   = BigDecimal.new(data[:unit_price])/100
    @merchant_id  = data[:merchant_id].to_i
    @created_at   = data[:created_at]
    @updated_at   = data[:updated_at]
  end

  # def invoice_items
    # returns a collection of InvoiceItems
    # associated with this object.
  # end
  #
  # def merchant
    # returns an instance of Merchant
    # associated with this object.
  # end
  #
  # def best_day
    # returns the date with the most sales
    # for the given item using the invoice date.
  # end

end
