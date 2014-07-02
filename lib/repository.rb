class Repository

  attr_accessor :objects

  def initialize(filename)
    class_name = Kernel.const_get(self.class.to_s.gsub("Repository", ""))
    @objects = CSV.open(filename, headers: true, header_converters: :symbol).collect do |row|
      class_name.new(row)
    end
  end

  def method_missing(meth, *args, &block)
    if meth.to_s =~ /^find_by_(.+)$/
      field_name = meth.to_s.split("find_by_").last
      @objects.find { |object| object.send(field_name) == args.first }
    elsif meth.to_s =~ /^find_all_by_(.+)$/
      field_name = meth.to_s.split("find_all_by_").last
      @objects.select { |object| object.send(field_name) == args.first }
    else
      super
    end
  end

  def respond_to?(meth)
    if meth.to_s =~ /^find_by_.*$/
      true
    elsif meth.to_s =~ /^find_all_by_(.+)$/
      true
    else
      super
    end
  end

  def all
    @objects
  end

  def random
    @objects.sample
  end

end
