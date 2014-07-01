require 'csv'
require_relative 'invoice_items'

class InvoiceItemRepository
  attr_reader :invoice_items

  def load(filename)
    @csv = CSV.open(filename, headers: true, header_converters: :symbol)
  end

  def build_invoice_items
    invoice_items = @csv.collect do |row|
      InvoiceItem.new(row)
    end
  end

  def find_by_invoice_id(invoice_id)
    build_invoice_items.select { |invoice_item| invoice_item.invoice_id == invoice_id }
  end
end
