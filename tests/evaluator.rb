require './evaluator'
require 'test/unit'

class TestEvaluator < Test::Unit::TestCase

  def test_get_expression_value
    assert_equal 2,       expr '1+1'
    assert_equal 527,     expr '12+(140-30)*3/2+(200)-3000+150+3000'
    assert_equal 3,       expr '5-2'
    assert_equal 6,       expr '(6*2)/2'
    assert_equal 3,       expr '1+ 2'
    assert_equal 4,       expr '2 + 2'
    assert_equal 55,      expr '22 + 33'
    assert_equal 3,       expr '100 / 50 + 1'
    assert_equal 3,       expr '(100 / 50) + 1'
    assert_equal 5,       expr '10 / 2'
    assert_equal 4,       expr '2 * 2'
    assert_equal 6,       expr '(6 * 2) / 2'
    assert_equal 7,       expr '4 + (3)'
    assert_equal 30,      expr '50-20'
    assert_equal 1,       expr '1'
    assert_equal 2,       expr '   2   '
  end

  private

    def expr(expression)
      Evaluator.new(expression).get_expression_value
    end

end
