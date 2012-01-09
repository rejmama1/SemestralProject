require 'lib/problem/configuration'
#Represents chromosome
class Chromosome
  #Genetic information of being
  attr_reader :configuration
  #Fitness of being
  attr_reader :fitness
  
  #Initialize being
  def initialize(configuration)
    @configuration = configuration
    @fitness = @configuration.fitness
      
  end
end
