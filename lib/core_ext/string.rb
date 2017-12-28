class String
  def indices(e)
    start, result = -1, []
    result << start while start = (self.index(e, start + 1))
    result
  end
end