require "./evaluator"
require "test/unit"
 
class TestSimpleNumber < Test::Unit::TestCase
 
  def test_get_expression_value
    assert_equal 2, Evaluator.new("1+1").get_expression_value
    assert_equal 3, Evaluator.new("5-2").get_expression_value
    assert_equal 6, Evaluator.new("(6*2)/2").get_expression_value
    assert_equal 4, Evaluator.new("2 * 2").get_expression_value
    assert_equal 5, Evaluator.new("10 / 2").get_expression_value
    assert_equal 6, Evaluator.new("(6 * 2) / 2").get_expression_value
    assert_equal 7, Evaluator.new("4 + (3)").get_expression_value
  end
 
end
