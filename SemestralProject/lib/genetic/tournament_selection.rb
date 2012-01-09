
class TournamentSelection
  def initialize
    @k = 4
    @p = 0.5
    @maxRand = 1 + ((1-@p)**(@k-1)) * (@p - 1)
  end
  
  def init(population)
    @population = population
  end
  
  #Selects mother and father to reproduce
  #Best being has 53% probability to be picked; best=best fitness
  def select
    tournament_attendants = Array.new
    for i in 0..@k - 1
      attendant = @population[rand(@population.size)]
      tournament_attendants.push(attendant) 
    end
    
    tournament_attendants.sort! { |a,b| a.fitness <=> b.fitness  }
    tmp = srand(2) * @maxRand
    p = @p
    cumulative_p = p
    
    for i in 0..@k - 2
      if tmp<cumulative_p 
        return tournament_attendants[i]
      end
      p = p*(1 - @p)
      cumulative_p += p
    end
    return tournament_attendants[@k-1]
  end
end
