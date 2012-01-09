#Genetic algorithm

require 'lib/problem/writable_result'
require 'lib/genetic/chromosome'
require 'lib/genetic/simple_mutation'
require 'lib/genetic/tournament_selection'
require 'lib/genetic/uniform_reproduction'

class GeneticAlgorithm
  attr_accessor :error,:best_fitness,:time 
  include WritableResult
  
  #Initializes algorithm
  #creates staring population
  #sets mutation rate
  #sets number of generations (how many times to cycle the algorithm)
  #sets number of beings in population
  def initialize(problem, population_size, mutation_rate, generations)
    @problem = problem
    @best_fitness = 0;
    @best_configuration = nil
    @error = 0
    @generations = generations
    
    @population_size = population_size
    @mutation_rate = mutation_rate
    
    
    if @population_size%2 != 0 || @population_size < 1
      raise("Population size must be even and higher than 1.")
    end
    
    @population = Array.new
    for i in 0..@population_size - 1
      conf = Configuration.new(@problem)
      ch = Chromosome.new(conf)
      @population.push(ch)
      
      if @best_configuration == nil || @best_fitness < ch.fitness
        @best_configuration = ch.configuration.conf
        @best_fitness = ch.fitness
      end
     
    end
    
    @selection = TournamentSelection.new
    @reproduction = UniformReproduction.new(@problem)
    @mutation = SimpleMutation.new(@problem, @mutation_rate)
    
    
  end
  
  #Creates new generations, respecting mutation rate, finds better fitness
  def solve
    @time = Time.new
    for j in 0..@generations
      new_generation = Array.new
      @selection.init(@population)
    
      for i in 0..(@population_size/2)-1
        children = @reproduction.reproduce(@selection.select,@selection.select,@mutation)
      
        son = children[0]
        daughter = children[1]
      
        if son.fitness > @best_fitness
          @best_fitness = son.fitness
          @best_configuration = son.configuration.conf
        end
      
        if daughter.fitness > @best_fitness
          @best_fitness = daughter.fitness
          @best_configuration = daughter.configuration.conf
        end
      
        new_generation.push(son)
        new_generation.push(daughter)
      
      end
    
      @population = new_generation
      
    end
    @time = Time.new - @time
  end
end
