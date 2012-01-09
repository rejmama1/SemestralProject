#Represents simple mutation - being has probability *mutation rate* to mutate

class SimpleMutation
  def initialize(problem, mutation_rate)
    @problem = problem
    @mutation_rate = mutation_rate
    
  end
  
  #Mutation of chromosome
  def mutate(attributes)
    if srand(2)< @mutation_rate
      index = rand(attributes.size)
      value = rand(2)
      attributes[index] = value
    end
  end
end
