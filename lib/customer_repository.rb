require 'csv'
require_relative 'customer'

class CustomerRepository
  attr_reader :customers

  def load(filename)
    @csv = CSV.open(filename, headers: true, header_converters: :symbol)
  end

  def build_customers
    @customers = @csv.collect do |row|
      Customer.new(row)
    end
  end

  
end
