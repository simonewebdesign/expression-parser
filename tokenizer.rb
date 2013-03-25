class Tokenizer

  attr_accessor :input, :start, :finish

  def initialize(inp)
    @input = inp
    @start = 0
    @finish = 0
    self.nextToken  # find the first token
  end

  def peekToken
    nil if @start >= @input.length
    @input[@start..@finish]
  end

  def nextToken
    r = self.peekToken
    puts "r uguale " + r
    @start = @finish
    r if @start >= @input.length

    if @input[@start].numeric?
      @finish = @start + 1
      @finish = @finish + 1 while @finish < @input.length && @input[@finish].numeric?
    else
      @finish = @start + 1
    end
    r
  end
  
end