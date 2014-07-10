require_relative 'merchant_repository'
require_relative 'customer_repository'
require_relative 'invoice_item_repository'
require_relative 'invoice_repository'
require_relative 'transaction_repository'
require_relative 'item_repository'

class SalesEngine

  attr_accessor :merchant_repository,
                :invoice_repository,
                :item_repository,
                :invoice_item_repository,
                :customer_repository,
                :transaction_repository

  def initialize(csv)
    @csv = csv
  end

  def startup
    load_repos

    transaction_relationships
    merchant_relationships
    invoice_relationships
    invoice_item_relationships
    item_relationships
    customer_relationships
  end

  def load_repos
    @merchant_repository     = MerchantRepository.new    "#{@csv}/merchants.csv"
    @item_repository         = ItemRepository.new        "#{@csv}/items.csv"
    @invoice_repository      = InvoiceRepository.new     "#{@csv}/invoices.csv"
    @invoice_item_repository = InvoiceItemRepository.new "#{@csv}/invoice_items.csv"
    @customer_repository     = CustomerRepository.new    "#{@csv}/customers.csv"
    @transaction_repository  = TransactionRepository.new "#{@csv}/transactions.csv"
  end


  def merchant_relationships
    merchant_repository.all.each do |merchant|
      merchant.items    = @item_repository.find_all_by_merchant_id(merchant.id)
      merchant.invoices = @invoice_repository.find_all_by_merchant_id(merchant.id)
    end
  end

  def customer_relationships
    @customer_repository.all.each do |customer|
      customer.invoices = @invoice_repository.find_all_by_customer_id(customer.id)
    end
  end

  def invoice_items_collection(invoice)
    @item_ids = invoice.invoice_items.map { |invoice_item| invoice_item.item_id }
    @items    = @item_ids.map { |id| item_repository.find_by_id(id) }
  end

  def invoice_relationships
    invoice_repository.all.each do |invoice|
      invoice.transactions  = @transaction_repository.find_all_by_invoice_id(invoice.id)
      invoice.invoice_items = @invoice_item_repository.find_all_by_invoice_id(invoice.id)
      invoice.customer      = @customer_repository.find_by_id(invoice.customer_id)
      invoice.merchant      = @merchant_repository.find_by_id(invoice.merchant_id)
      invoice.items         = invoice_items_collection(invoice)
    end
  end

  def invoice_item_relationships
    invoice_item_repository.all.each do |invoice_item|
      invoice_item.invoice = @invoice_repository.find_by_id(invoice_item.invoice_id)
      invoice_item.item    = @item_repository.find_by_id(invoice_item.item_id)
      invoice_item.items   = @item_repository.find_all_by_id(invoice_item.item_id)
    end
  end

  def transaction_relationships
    @transaction_repository.all.each do |transaction|
      transaction.invoice  = @invoice_repository.find_by_id(transaction.invoice_id)
    end
  end

  def item_relationships
    @item_repository.all.each do |item|
      item.invoice_items = @invoice_item_repository.find_all_by_item_id(item.id)
      item.merchant      = @merchant_repository.find_by_id(item.merchant_id)
    end
  end

end
