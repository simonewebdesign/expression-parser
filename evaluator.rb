require './tokenizer'

class Evaluator

  attr_accessor :tokenizer

  def initialize(expression)
    puts "The expression is #{expression}"
    @tokenizer = Tokenizer.new expression
  end

  def get_expression_value
    value = get_term_value
    done = false
    while !done
      token = @tokenizer.peek_token
      puts "[get_expression_value] peek_token: '#{token}'"
      if (token == "+" || token == "-")
        puts "[get_expression_value] token is #{token} (+ or -)."
        puts "[get_expression_value] calling [next_token]"
        @tokenizer.next_token # discard + or -
        puts "[get_expression_value] calling [get_term_value]"
        value2 = get_term_value
        puts "[get_expression_value] get_term_value2: '#{value2}'"

        if    token == "+"  
          value = value.to_i + value2.to_i 
        elsif token == "-"
          puts "it is a subtraction. '#{value}' '#{value2}'"
          value = value.to_i - value2.to_i 
        end

      else
        done = true
        puts "[get_expression_value] Done."
      end
    end
    puts "#######THE VALUE IS #{value}"
    value
  end

  def get_term_value
    value = get_factor_value
    done = false
    while !done
      token = @tokenizer.peek_token
      puts "[get_term_value] token: '#{token.to_s}'"

      if token == "*" || token == "/"
        @tokenizer.next_token
        value2 = get_factor_value
        if token == "*"
          value = value.to_i * value2.to_i
        elsif token == "/"
          value = value.to_i / value2.to_i
        end
      else
        done = true
        puts "[get_term_value] Done."
      end
    end
    value
  end

  def get_factor_value
    value = 0
    puts '[get_factor_value] calling [peek_token]'
    token = @tokenizer.peek_token
    puts "[get_factor_value] next token: '#{token}'"
    if token == "("
      @tokenizer.next_token # ignore "("
      value = get_expression_value
      @tokenizer.next_token # ignore ")"
    else
      puts '[get_factor_value] calling [next_token]'
      value = @tokenizer.next_token
    end
    puts "[get_factor_value]: returning '#{value}'"
    value
  end

end
