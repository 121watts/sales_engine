class InvoiceItem

  attr_reader :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :unit_price,
              :created_at,
              :updated_at

  attr_accessor :invoice_items,
                :invoice,
                :item,
                :items,
                :merchant

  def inspect
      "#<#{self.class} #{@invoice_items.size} rows>"
    end

  def initialize(data)
    @id         = data[:id].to_i
    @item_id    = data[:item_id].to_i
    @invoice_id = data[:invoice_id].to_i
    @quantity   = data[:quantity].to_i
    @unit_price = data[:unit_price]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end

end
