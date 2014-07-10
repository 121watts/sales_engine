require_relative 'invoice'
require_relative 'repository'

class InvoiceRepository < Repository

def inspect
    "#<#{self.class} #{@invoices.size} rows>"
  end

end
