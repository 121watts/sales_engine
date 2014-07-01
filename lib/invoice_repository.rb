require 'csv'
require_relative 'invoice'

class InvoiceRepository
  attr_reader :invoices

  def load(filename)
    @csv = CSV.open(filename, headers: true, header_converters: :symbol)
  end

  def build_invoices
    @invoices = @csv.collect do |row|
      Invoice.new(row)
    end
  end

  # Is this the same as build_invoices?
  # def create
  # end
end
