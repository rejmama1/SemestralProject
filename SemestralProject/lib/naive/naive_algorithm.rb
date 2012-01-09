require 'lib/naive/stack'
require 'lib/problem/configuration'
require 'lib/problem/writable_result'
#Brute-force algorithm to solve knapsack problem
class NaiveAlgorithm
  #Gives best found fitness
  attr_reader :best_fitness
  #Gives best found configuration of knapsack
  attr_reader :best_configuration
  include WritableResult
  
  def initialize(problem)
    @time = 0
    @problem = problem
    @stack = Stack.new
    @best_configuration = Array.new
    @current_configuration = Array.new
    @best_fitness = 0
    @dimension = @problem.n
    @error=0
    
    for i in 0..@dimension - 1
      @best_configuration.push(0)
      @stack.push(0)
      @current_configuration.push(0)
    end
  end
  
  #Solves problem using naive algorithm
  #Tries to combinate all with each other
  def solve
    @time = Time.new
    while true
      if @stack.pop == 0
      else
        while (not @stack.empty?) && (@stack.peek == 1)
          @stack.pop
        end
        if not @stack.empty?
          @stack.pop
        else
          b = Time.new
          @time = b - @time
          return
        end
        
      end
      
      @current_configuration[@stack.size] = 1
      @stack.push(1)
      while @stack.size < @dimension
        @current_configuration[@stack.size] = 0
        @stack.push(0)
      end
      
      conf = Configuration.new(@current_configuration, @problem)
      curr_fitness = conf.fitness
      if curr_fitness > @best_fitness
        @best_fitness = curr_fitness
        for i in 0..@current_configuration.size - 1
          @best_configuration[i] = @current_configuration[i]
        end
      
      end
    
    end
    
   
  end
end
