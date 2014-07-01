require 'csv'
require_relative 'merchant'

class MerchantRepository
  attr_reader :merchants

  def load(filename)
    @csv = CSV.open(filename, headers: true, header_converters: :symbol)
  end

<<<<<<< HEAD
  def initialize
    @merchants = merchants
  end

=======
>>>>>>> 66798bfdf8cc8429869b908718ffbfe847083d98
  def build_merchants
    @merchants = @csv.collect do |row|
      Merchant.new(row)
    end
  end
<<<<<<< HEAD
  #do we want this somewhere else?
  def find_all_by_name(name)
    build_merchants.select { |merchant| merchant.name == name }
  end
=======
>>>>>>> 66798bfdf8cc8429869b908718ffbfe847083d98

  # def most_revenue
  #   returns the top x merchant instances
  #   ranked by total revenue
  # end
  #
  # def most_items
  #   returns the top x merchant instances
  #   ranked by total number of items sold
  # end
  #
  # def revenue(date)
  #   returns the total revenue for
  #   that date across all merchants
  # end
end
