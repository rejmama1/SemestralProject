#Represents reproduction

class UniformReproduction
  def initialize(problem)
    @problem = problem
  end
  
  #New being is created due to mask chromosome
  #All beings can mutate
  #They are return to new generation
  def reproduce(chrmsm,chrmsm1, mutation)
    mask_conf = Configuration.new(@problem)
    @mask = mask_conf.conf
    child1_attrs = Array.new
    child2_attrs = Array.new
    for i in 0..@mask.size - 1
      if @mask[i] == 1
        child1_attrs.push(chrmsm.configuration.conf[i])
        child2_attrs.push(chrmsm1.configuration.conf[i])
      else
        child1_attrs.push(chrmsm1.configuration.conf[i])
        child2_attrs.push(chrmsm.configuration.conf[i])
      end
    end
    
    mutation.mutate(child1_attrs)
    mutation.mutate(child2_attrs)
    
    children=Array.new
    children.push(Chromosome.new(Configuration.new(child1_attrs, @problem)))
    children.push(Chromosome.new(Configuration.new(child2_attrs, @problem)))
    return children

  end
end
