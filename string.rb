class String

  def numeric?
    Float(self) != nil rescue false
  end

  def strip_whitespace_chars
    self.gsub(/\s+/, "")
  end

end
