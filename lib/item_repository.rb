require_relative 'item'
require_relative 'repository'

class ItemRepository<Repository

  def inspect
    "#<#{self.class} #{@items.size} rows>"
  end

end
