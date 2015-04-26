require './string.rb'

class Tokenizer
  attr_accessor :input, :start, :finish

  def initialize(inp)
    @input = inp.strip_whitespace_chars
    @start = 0
    @finish = 0
    next_token  # find the first token
  end

  def peek_token
    return nil if @start >= @input.length
    if @start == 0 && @finish == 0
      return @input[0]
    else
      token = @input[@start...@finish].strip

      if token.empty?
        @finish = @finish + 1
        peek_token
      else
        return token
      end
    end
  end

  def next_token
    result = peek_token
    @start = @finish
    return result if @start >= @input.length

    if @input[@start].numeric?
      @finish = @start + 1
      while @finish < @input.length && @input[@finish].to_s.strip.numeric?
        @finish = @finish + 1
      end
    else
      @finish = @start + 1
    end
    result
  end

end
