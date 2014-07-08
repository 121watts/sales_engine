require_relative 'customer'
require_relative 'repository'

class CustomerRepository < Repository
  def inspect
    "#<#{self.class} #{@customers.size} rows>"
  end
end
