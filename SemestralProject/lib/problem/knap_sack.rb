#Represents problem
class KnapSack
  
  attr_reader :prices,:weights, :n, :M, :id
  def initialize(file)
    
    
    
    begin
      @f = File.open(file,"r")
    rescue Exception
     STDERR.puts "Failed to open file #{@file}: #{$!}"
     raise
   end
  end
  
  #Load next problem from file
  def load_problem
    @prices = Array.new
    @weights = Array.new
   
    line = @f.gets
    
    tokens = line.scan(/[-+]?\d*\.?\d+/)
    
    if tokens.size % 2 == 0 && tokens.size < 3
      fail("Wrong problem format.")
    end
    
    @id = Integer(tokens[0])
    @n = Integer(tokens[1])
    @M = Integer(tokens[2])
    
    if(tokens.size != @n*2 + 3)
      fail("Wrong problem format.")
    end
    
    for i in 0..@n - 1
      @weights.push(Integer(tokens[3 + (i*2)]))
      @prices.push(Integer(tokens[3 + 1 + (i*2)]))
    end
    
    
   
  end
end
