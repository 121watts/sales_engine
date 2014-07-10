require_relative 'invoice_items'
require_relative 'repository'


class InvoiceItemRepository < Repository

  def inspect
    "#<#{self.class} #{@invoice_items.size} rows>"
  end

end
