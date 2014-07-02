require 'csv'
require_relative 'merchant_repository'
require_relative 'customer_repository'
require_relative 'invoice_item_repository'
require_relative 'invoice_repository'
require_relative 'transaction_repository'
require_relative 'item_repository'

class SalesEngine
  attr_accessor :merchant_repository,
                :invoice_respository,
                :item_repository,
                :invoice_item_repository,
                :customer_repository,
                :transaction_repository

  def startup(test_mode = false)
    if test_mode
      @merchant_repository     = MerchantRepository.new('./test/fixtures/small_merchants.csv')
      @item_repository         = ItemRepository.new('./test/fixtures/small_items.csv')
      @invoice_repository      = InvoiceRepository.new('./test/fixtures/small_invoices.csv')
      @invoice_item_repository = InvoiceItemRepository.new('./test/fixtures/small_invoice_items.csv')
      @customer_repository     = CustomerRepository.new('./test/fixtures/small_customers.csv')
      @transaction_repository  = TransactionRepository.new('./test/fixtures/small_transactions.csv')
    else
      @merchant_repository     = MerchantRepository.new('./data/merchants.csv')
      @item_repository         = ItemRepository.new('./data/items.csv')
      @invoice_repository      = InvoiceRepository.new('./data/invoices.csv')
      @invoice_item_repository = InvoiceItemRepository.new('./data/invoice_items.csv')
      @customer_repository     = CustomerRepository.new('./data/customers.csv')
      @transaction_repository  = TransactionRepository.new('./data/transactions.csv')
    end
  end
    # Associate all items with merchants that sell them
  def merchant
    merchants = @merchant_repository.all
    random_merchant = @merchant_repository.random

    merchants.each do |merchant|
      items = merchant.items    = @item_repository.find_all_by_merchant_id(merchant.id)
      merchant.invoices = @invoice_repository.find_all_by_merchant_id(merchant.id)
    end
  end

  def invoice
    invoices = @invoice_repository.all

    invoices.each do |invoice|
      invoice.transactions  = @transaction_repository.find_all_by_invoice_id(invoice.id)
      invoice.invoice_items = @invoice_item_repository.find_all_by_invoice_id(invoice.id)
      # invoice.items         = @invoice_item_repository.find_all_by_item_id(invoice.id)
      invoice.customer      = @customer_repository.find_by_id(invoice.customer_id)
      invoice.merchant      = @merchant_repository.find_by_id(invoice.merchant_id)
    end
  end

  def invoice_item
    invoice_items = @invoice_item_repository.all

    invoice_items.each do |invoice_item|
      invoice_item.invoice = @invoice_repository.find_by_id(invoice_item.invoice_id)
      invoice_item.item    = @item_repository.find_by_id(invoice_item.item_id)
    end
  end

  def item
    items = @item_repository.all

    items.each do |item|
      item.invoice_items = @invoice_item_repository.find_all_by_id(item.id)
      item.merchant      = @merchant_repository.find_by_id(item.merchant_id)
    end
  end

  def transaction
    transactions = @transaction_repository.all

    transactions.each do |transaction|
      transaction.invoice  = @invoice_repository.find_by_id(transaction.invoice_id)
    end
  end

  def customer
    customers = @customer_repository.all

    customers.each do |customer|
      customer.invoices = @invoice_repository.find_all_by_customer_id(customer.id)
    end
  end
end

engine = SalesEngine.new
engine.startup(true)
