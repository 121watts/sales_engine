require 'csv'
require_relative 'repository'
require_relative 'invoice'

class InvoiceRepository < Repository
  attr_reader :invoices

  def build_invoices
    @invoices = @csv.collect do |row|
      Invoice.new(row)
    end
  end

  # Is this the same as build_invoices?
  # def create
  # end
end
