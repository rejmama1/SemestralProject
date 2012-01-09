#Module can write algorithm result
module WritableResult
   def write_result
     puts "Instance ID: #{@problem.id}"
     puts "Best fitness is: #{@best_fitness}"
     print "Corresponding configuration is: "
     for i in 0..@best_configuration.size - 1
       print @best_configuration[i].to_s + " "
     end
     puts ""
     puts "Relative error: #{@error}%"
     puts "Evaluating time is: #{@time}s"
     
     puts ""
   end 
end
