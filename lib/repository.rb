class Repository

  def load(filename)
    @csv = CSV.open(filename, headers: true, header_converters: :symbol)
  end

  def build
  end

  # Should probably put these in a finder class
  # def find_by
  # end
  #
  # def find_by_all
  # end
  #
  # def random
  # end
end
