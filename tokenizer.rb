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
    return nil if @start >= @input.length
    puts "[peek_token] @input[#{@start}...#{@finish}]='#{@input[@start...@finish]}'"
    @input[@start...@finish]
  end

  def next_token
    result = peek_token
    puts "peek_token: '#{result}'"
    @start = @finish
    return result if @start >= @input.length
    #puts "non ritornato"

    if @input[@start].numeric?
      puts "@input[#{@start}]='#{@input[@start]}' appears to be numeric!"
      @finish = @start + 1
      #puts "finish minore di input length: #{@finish < @input.length}"
      puts "@input[#{@finish}]='#{@input[@finish]}' numeric? #{@input[@finish].to_s.numeric?}"
      while @finish < @input.length && @input[@finish].to_s.numeric?
        puts "sono qui"
        @finish = @finish + 1
      end
    else
      @finish = @start + 1
    end

    result
  end

end
