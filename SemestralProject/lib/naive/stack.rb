# To change this template, choose Tools | Templates
# and open the template in the editor.

class Stack
  def initialize
    @stack = Array.new
  end
  
  def push(item)
    @stack.push(item)
  end
  
  def pop
    @stack.pop
  end
  
  def empty?
    @stack.empty?
  end
  
  def peek
    return @stack[@stack.size - 1]
  end
  
  def size
    return @stack.size
  end
end
