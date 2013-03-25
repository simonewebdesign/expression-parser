class String
  def numeric?
    Float(self) != nil rescue false
  end
end

require './tokenizer.rb'
require './evaluator.rb'

print "Enter an expression: "
expression = gets

evaluator = Evaluator.new expression 
result = evaluator.getExpressionValue

puts expression
print "= " + result