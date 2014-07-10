require 'csv'

class Repository

  attr_accessor :objects

  def inspect
    "#<Repository>"
  end

  def initialize(filename)
    class_name = Kernel.const_get(self.class.to_s.gsub("Repository", ""))
    @objects = CSV.open(filename, headers: true, header_converters: :symbol).collect do |row|
      class_name.new(row)
    end
  end

  def all
    @objects
  end

  def random
    @objects.sample
  end

  def method_missing(method, *args)
    case method.to_s
    when /^find_by_(.+)$/
      find_by(method, *args)
    when /^find_all_by_(.+)$/
      find_all_by(method, *args)
    else
      super
    end
  end

  def find_by(method, *args)
    field_name = method.to_s.split("find_by_").last
    @objects.find { |object| object.send(field_name) == args.first }
  end

  def find_all_by(method, *args)
    field_name = method.to_s.split("find_all_by_").last
    @objects.select { |object| object.send(field_name) == args.first }
  end

  def respond_to?(method)
    case method.to_s
    when /^find_by_.*$/
      true
    when /^find_all_by_(.+)$/
      true
    else
      super
    end
  end

end
