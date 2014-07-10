require_relative 'merchant_repository'
require_relative 'customer_repository'
require_relative 'invoice_item_repository'
require_relative 'invoice_repository'
require_relative 'transaction_repository'
require_relative 'item_repository'
require_relative 'relationships'

class SalesEngine
  include Relationships

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

    transaction_relationships(transaction_repository)
    merchant_relationships(merchant_repository)
    invoice_relationships(invoice_repository)
    invoice_item_relationships(invoice_item_repository)
    item_relationships(item_repository)
    customer_relationships(customer_repository)
  end

  def load_repos
    @merchant_repository     ||= MerchantRepository.new    "#{@csv}/merchants.csv"
    @item_repository         ||= ItemRepository.new        "#{@csv}/items.csv"
    @invoice_repository      ||= InvoiceRepository.new     "#{@csv}/invoices.csv"
    @invoice_item_repository ||= InvoiceItemRepository.new "#{@csv}/invoice_items.csv"
    @customer_repository     ||= CustomerRepository.new    "#{@csv}/customers.csv"
    @transaction_repository  ||= TransactionRepository.new "#{@csv}/transactions.csv"
  end

end
