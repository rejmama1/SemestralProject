require 'lib/problem/knap_sack'
require 'lib/naive/naive_algorithm'
require 'lib/dynamic/dynamic_algorithm'
require 'lib/genetic/genetic_algorithm'

if ARGV.size < 3
  puts "Ex: main.rb knap_10.inst.dat 50 1"
  puts "Algorithm types:"
  puts "0 - naive algorithm"
  puts "1 - dynamic algorithm"
  puts "2 - genetic algorithm"
  fail("Set path to instance file, amount of instances in it and algorithm type")
end
problem = KnapSack.new(ARGV[0])
for i in 0..Integer(ARGV[1]) - 1
  problem.load_problem
  case Integer(ARGV[2])
  when 0
    puts "Naive algorithm"
    algorithm = NaiveAlgorithm.new(problem)
    algorithm.solve
  when 1
    puts "Dynamic algorithm"
    algorithm = DynamicAlgorithm.new(problem)
    algorithm.solve
  when 2
    if(ARGV.size != 6)
      population_size = 100
      mutation_rate = 0.01
      cycle = 1000
    else
      population_size = Integer(ARGV[3])
      mutation_rate = Float(ARGV[4])
      cycle = Integer(ARGV[5])
    end
    puts "Genetic algorithm"
    algorithm_opt = DynamicAlgorithm.new(problem)
    algorithm_opt.solve
    algorithm = GeneticAlgorithm.new(problem,population_size,mutation_rate,cycle)
    algorithm.solve
    
    error=(algorithm_opt.best_fitness-algorithm.best_fitness).abs.to_f / [algorithm_opt.best_fitness,algorithm.best_fitness].max*100
    algorithm.time+=algorithm_opt.time
    algorithm.error = error
    
    
    
  else
    puts "Dynamic algorithm(else)"
    algorithm = DynamicAlgorithm.new(problem)
    algorithm.solve
  end
  
  
  algorithm.write_result
end

puts "DONE."