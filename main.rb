require './evaluator.rb'

# This program calculates the value of an expression
# consisting of numbers, arithmetic operators, and parentheses.
print 'Enter an expression: '
expression = gets

evaluator = Evaluator.new expression 
result = evaluator.get_expression_value

puts "=> #{result}"
