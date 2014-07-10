class Invoice

    attr_reader :id,
                :customer_id,
                :merchant_id,
                :status,
                :created_at,
                :updated_at

    attr_accessor :transactions,
                  :invoice_items,
                  :items,
                  :customer,
                  :merchant

    def inspect
      "#<#{self.class} #{@invoices.size} rows>"
    end

    def initialize(data)
      @id           = data[:id].to_i
      @customer_id  = data[:customer_id].to_i
      @merchant_id  = data[:merchant_id].to_i
      @status       = data[:status]
      @created_at   = data[:created_at]
      @updated_at   = data[:updated_at]
    end

end
