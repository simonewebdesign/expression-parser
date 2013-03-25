class Evaluator

  attr_accessor :tokenizer

  def initialize(expression)
    @tokenizer = Tokenizer.new expression
  end

  def getExpressionValue
    value = self.getTermValue
    done = false
    while !done
      token = @tokenizer.peekToken
      if (token == "+" || token == "-")
        print "token equals plus or minus!"
        @tokenizer.nextToken  # ignore + or -
        value2 = self.getTermValue
        if    token == "+"  
          value = value + value2 
        elsif token == "-"  
          value = value - value2 
        end
      else
        done = true
      end
    end
    value
  end

  def getTermValue
    value = self.getFactorValue
    done = false
    while !done
      token = @tokenizer.peekToken
      if token == "*" || token == "/"
        @tokenizer.nextToken
        value2 = getFactorValue
        if    token == "*"
          value = value * value2
        elsif token == "/"
          value = value / value2
        end
      else
        done = true
      end
    end
    value
  end

  def getFactorValue
    value = 0
    token = @tokenizer.peekToken
    if token == "("
      @tokenizer.nextToken  # ignore "("
      value = self.getExpressionValue
      @tokenizer.nextToken   # ignore ")"
    else
      value = @tokenizer.nextToken
    end
    value
  end

end