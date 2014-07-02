require 'csv'
require_relative 'merchant_repository'
require_relative 'customer_repository'
require_relative 'invoice_item_repository'
require_relative 'invoice_repository'
require_relative 'transaction_repository'
require_relative 'item_repository'

class SalesEngine
  attr_accessor :merchant_repository, :invoice_respository

  def startup(test_mode = false)
    if test_mode
      @merchant_repository     = MerchantRepository.new('./data/merchants.csv')
      @item_repository         = ItemRepository.new('./data/items.csv')
      @invoice_repository      = InvoiceRepository.new('./data/invoices.csv')
      @invoice_item_repository = InvoiceItemRepository.new('./data/invoice_items.csv')
      @customer_repository     = CustomerRepository.new('./data/customers.csv')
      @transaction_repository  = TransactionRepository.new('./data/transactions.csv')
    else
      @merchant_repository     = MerchantRepository.new('./data/merchants.csv')
      @item_repository         = ItemRepository.new('./data/items.csv')
      @invoice_repository      = InvoiceRepository.new('./data/invoices.csv')
      @invoice_item_repository = InvoiceItemRepository.new('./data/invoice_items.csv')
      @customer_repository     = CustomerRepository.new('./data/customers.csv')
      @transaction_repository  = TransactionRepository.new('./data/transactions.csv')
    end
    # Associate all items with merchants that sell them
    merchants = @merchant_repository.all

    merchants.each do |merchant|
      merchant.items    = @item_repository.find_all_by_merchant_id(merchant.id)
      merchant.invoices = @invoice_repository.find_all_by_merchant_id(merchant.id)
    end

    invoices = @invoice_repository.all

    invoices.each do |invoice|
      invoice.transactions  = @transaction_repository.find_all_by_invoice_id(invoice.id)
      invoice.invoice_items = @invoice_item_repository.find_all_by_invoice_id(invoice.id)
      # invoice.items         = @item_repository.find_all_by_invoice_id(invoice.id)
      invoice.customer      = @customer_repository.find_by_id(invoice.customer_id)
      invoice.merchant      = @merchant_repository.find_by_id(invoice.merchant_id)
    end

  end
end
