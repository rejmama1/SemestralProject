# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'lib/problem/knap_sack'
require 'lib/naive/naive_algorithm'
require 'lib/dynamic/dynamic_algorithm'


class Tests < Test::Unit::TestCase
  #Tests naive algorithm
  def test_naive
    problem = KnapSack.new("test/test1.txt")
    problem.load_problem
    assert_equal(90,problem.id)
    assert_equal(2,problem.n)
    assert_equal(20,problem.M)
    assert_equal(2,problem.weights.size)
    assert_equal(2,problem.prices.size)
    algorithm = NaiveAlgorithm.new(problem)
    algorithm.solve
    assert_equal(100,algorithm.best_fitness)
    assert_equal(2,algorithm.best_configuration.size)
    assert_equal(1,algorithm.best_configuration[0])
    assert_equal(0,algorithm.best_configuration[1])
  end
  
  #Tests dynamic algorithm
   def test_dynamic
    problem = KnapSack.new("test/test1.txt")
    problem.load_problem
    assert_equal(90,problem.id)
    assert_equal(2,problem.n)
    assert_equal(20,problem.M)
    assert_equal(2,problem.weights.size)
    assert_equal(2,problem.prices.size)
    algorithm = DynamicAlgorithm.new(problem)
    algorithm.solve
    assert_equal(100,algorithm.best_fitness)
    assert_equal(2,algorithm.best_configuration.size)
    assert_equal(1,algorithm.best_configuration[0])
    assert_equal(0,algorithm.best_configuration[1])
  end
end
