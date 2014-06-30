require 'csv'
require_relative 'merchant'

class MerchantRepository

  attr_reader :merchants

  def load(filename = 'test/fixtures/small_merchants.csv')
    @csv = CSV.open(filename, headers: true, header_converters: :symbol)
  end

  def initialize
    @merchants = merchants
  end

  def build_merchants
    merchants = @csv.collect do |row|
      Merchant.new(row)
    end
  end

  def find_by_name(name)
    build_merchants.select { |merchant| merchant.name == name }
  end

end
