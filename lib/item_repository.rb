require 'csv'
require_relative 'item'

class ItemRepository
  attr_reader :items

  def load(filename)
    @csv = CSV.open(filename, headers: true, header_converters: :symbol)
  end

  def initialize
    @items = items
  end

  def build_items
    @items = @csv.collect do |row|
      Item.new(row)
    end
  end

  # def most_revenue(x)
  #   returns the top x item instances
  #   ranked by total revenue generated
  # end
  #
  # def most_items(x)
  #   returns the top x item instances
  #   ranked by total number sold
  # end
end
