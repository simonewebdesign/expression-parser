require './string.rb'

# This class breaks up a string describing an expression
# into tokens: numbers, parentheses, and operators.
class Tokenizer
  attr_accessor :input, :start, :finish

  # Constructs a tokenizer.
  # @param expression the string to tokenize
  def initialize(expression)
    @expression = expression.strip_whitespace_chars
    @start = 0  # The start of the current token
    @finish = 0 # The position after the end of the current token
    next_token  # Find the first token
  end

  # Peeks at the next token without consuming it.
  # @return the next token or nil if there are no more tokens
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

  # Gets the next token and moves the tokenizer to the following token.
  # @return the next token or nil if there are no more tokens
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
