#Configuration of problem
#items in sack
class Configuration
  attr_reader :conf
  def initialize(list=nil, problem)
    @problem = problem
    if(list==nil)
       get_random_configuration
    else
      @conf = list
    end
    
    
  end
 
  #Evaluates fitness of current configuration
  def fitness
    fitness = 0
    weight = 0
    for i in 0..@conf.size - 1
      if @conf[i] == 1
        fitness += @problem.prices[i]
        weight += @problem.weights[i]
      end
      
      if weight > @problem.M
        return -1
      end
    end
    
    return fitness
  end
  
  
  #Generates random configuration
  private
  def get_random_configuration
    @conf = Array.new
    for i in 0..@problem.n - 1
      @conf.push(rand(2))
    end
  
  end
end
