require 'lib/problem/writable_result'
# Solves knapsack problem using dynamic programming algorithm - precounting prices
class DynamicAlgorithm
  include WritableResult
  
  attr_reader :time,:best_fitness,:best_configuration
  #Initializes algorithm
  #1/ Creates table maxWeight+1 x amount of items
  #2/ Initializes table - 0 items in sack => price = 0
  def initialize(problem)
    @problem = problem
    @best_configuration = Array.new
    @current_configuration = Array.new
    @best_fitness = 0
    @weights = @problem.M + 1
    @itemsSize = @problem.n + 1
    @table = Array.new(@weights) { Array.new(@itemsSize) }
    @error=0
    
    
    for i in 0..@weights - 1
      @table[i][0] = 0
    end
  end
  
  #Optimizes problem
  #1/ if M=0 => all prices = 0
  #2/ if we can put item is sack we do it, otherwise not
  #3/ best fitness is found in right-bottom corner
  # corresponding solution is count drom last line; changing value=> item i in sack; same value=>not in sack
  def solve
    a = Time.new
    for i in 0..@itemsSize - 1
      @table[0][i] = 0
    end
    
    for i in 1..@itemsSize - 1
      price =  @problem.prices[i-1]
      weight = @problem.weights[i-1]
      for w in 1..@weights - 1
        if weight <= w
          if (price + @table[w - weight][i - 1]) > @table[w][i -1]
            @table [w][i]= price + @table[w - weight][i - 1]
          else
            @table[w][i] = @table[w][i - 1]
          end
        else
          @table[w][i] = @table[w][i - 1]
        end
      end
    end
    
    
    prev_item = 0
    for i in 1..@itemsSize - 1
      curr_item = @table[@weights - 1][i]
      if prev_item < curr_item
        @best_configuration.push(1)
      else
        @best_configuration.push(0)
      end
      prev_item = curr_item
    end
    
    @best_fitness = @table[@weights - 1][@itemsSize - 1]
    
    b = Time.new
    @time = b-a
  end
end

