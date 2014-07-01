require 'csv'
require_relative 'repository'

class ItemRepository < Repository
  attr_reader :items

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
