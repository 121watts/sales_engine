require_relative 'merchant_repository'
require_relative 'customer_repository'
require_relative 'invoice_item_repository'
require_relative 'invoice_repository'
require_relative 'transaction_repository'
require_relative 'item_repository'
require          'pry'

class SalesEngine

  attr_accessor :merchant_repository,
                :invoice_repository,
                :item_repository,
                :invoice_item_repository,
                :customer_repository,
                :transaction_repository

  def initialize(csv_directory)
    @csv_directory = csv_directory
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
    @merchant_repository     = MerchantRepository.new    "#{@csv_directory}/merchants.csv"
    @item_repository         = ItemRepository.new        "#{@csv_directory}/items.csv"
    @invoice_repository      = InvoiceRepository.new     "#{@csv_directory}/invoices.csv"
    @invoice_item_repository = InvoiceItemRepository.new "#{@csv_directory}/invoice_items.csv"
    @customer_repository     = CustomerRepository.new    "#{@csv_directory}/customers.csv"
    @transaction_repository  = TransactionRepository.new "#{@csv_directory}/transactions.csv"
  end


  def merchant_relationships
    merchant_repository.all.each do |merchant|
      merchant.items    = @item_repository.find_all_by_merchant_id(merchant.id)
      merchant.invoices = @invoice_repository.find_all_by_merchant_id(merchant.id)
    end
  end

  def customer_relationships
    @customer_repository.all.each do |customer|
      customer.invoices      = @invoice_repository.find_all_by_customer_id(customer.id)
    end
  end

  def invoice_relationships
    invoice_repository.all.each do |invoice|
      invoice.transactions  = @transaction_repository.find_all_by_invoice_id(invoice.id)
      invoice.invoice_items = @invoice_item_repository.find_all_by_invoice_id(invoice.id)
      invoice.customer      = @customer_repository.find_by_id(invoice.customer_id)
      invoice.merchant      = @merchant_repository.find_by_id(invoice.merchant_id)
      invoice.items         = invoice_items_collection(invoice) # => This is failing
    end
  end

  def invoice_items_collection(invoice)
    @items = invoice.invoice_items.map { |invoice_item| invoice_item.items }
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
      item.invoice_items = @invoice_item_repository.find_all_by_id(item.id)
      item.merchant      = @merchant_repository.find_by_id(item.merchant_id)
    end
  end
end



#   # def most_rev
# #################################################################################
# # builds an item_id/total_rev hash
#   def revenue_per_item
#     items = @invoice_item_repository.all
#     revenue_per_item = []
#     items.each do |item|
#       total_revenue = (item.quantity.to_i * item.unit_price.to_i)
#       @revenue_per_item << { item.item_id => total_revenue}.reduce
#     end
#   end
# #################################################################################
# # totals revenue for each item
#   def total_item_revenue
#     total_item_revenue = Hash.new(0)
#     @revenue_per_item.each { |key, count| total_item_revenue[key] += count }
#     @total_item_revenue
#   end
# #################################################################################
# # builds an item_id/merchant_id hash
#   def merchant_item_id
#     items = @item_repository.all
#     merchant_items = []
#     items.collect do |item|
#       @merchant_items << {item.id => item.merchant_id}
#     end
#     @merchant_items
#   end
# ################################################################################
# #
#   def merchant_item_revenue
#     @new_array = []
#     @merchant_items.each do |merch_item|
#       merch_item.merge(total_item_revenue) {|key, value1, value2|
#       @new_array << {value1 => value2} }
#     end
#   end
# #################################################################################
# #
#   def most_revenue(x)
#     revenue_per_item
#     total_item_revenue
#     merchant_item_id
#     merchant_item_revenue
#     merchant_total_revenue = @new_array.group_by(&:keys).map{|k, v|
#       {k.first => v.flat_map(&:values).reduce(:+)}}
#     sorted_merchs = merchant_total_revenue.sort_by { |merchant| -merchant.values}
#     p sorted_merchs[0...x]
#   end
# #################################################################################
#
# engine = SalesEngine.new
# engine.startup
