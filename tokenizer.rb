require './string.rb'

class Tokenizer
  attr_accessor :input, :start, :finish

  def initialize(inp)
    @input = inp
    @start = 0
    @finish = 0
    next_token  # find the first token
  end

  def peek_token
    puts "[peek_token] hey."
    puts "[peek_token] returning nil because @start >= @input.length" if @start >= @input.length
    return nil if @start >= @input.length
    if @start == 0 && @finish == 0
      puts "[peek_token] just starting with '#{input[0]}'"
      return @input[0]
    else
      token = @input[@start...@finish].strip

      if token.empty?
        @finish = @finish + 1
        puts "[peek_token] token='#{token}' was empty. Incrementing finish."
        puts "[peek_token] calling myself again."
        peek_token
      else
        puts "[peek_token] returning @input[#{@start}...#{@finish}].strip='#{@input[@start...@finish].strip}'"
        return token
      end
    end
  end

  def next_token
    result = peek_token
    puts "[next_token] token peeked: '#{result}'"
    @start = @finish
    puts "returning because @start='#{@start}' >= @input.length=#{@input.length} (we're done here)" if @start >= @input.length
    return result if @start >= @input.length

    if @input[@start].numeric?
      puts "@input[#{@start}]='#{@input[@start]}' appears to be numeric!"
      @finish = @start + 1
      #puts "finish minore di input length: #{@finish < @input.length}"
      puts "@input[#{@finish}].to_s.strip='#{@input[@finish].to_s.strip}' numeric? #{@input[@finish].to_s.strip.numeric?}"
      while @finish < @input.length && @input[@finish].to_s.strip.numeric?
        puts "Number not finished yet. Incrementing finish."
        @finish = @finish + 1
      end
    else
      @finish = @start + 1
    end
    puts "[*next_token] returning: '#{result}'"
    result
  end

end
