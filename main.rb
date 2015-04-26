require './evaluator.rb'

# binding.pry
print "Enter an expression: "
expression = "2 + 3   - 4 +  4" # gets

evaluator = Evaluator.new expression 
result = evaluator.get_expression_value

print "= #{result}"
