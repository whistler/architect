module Architect
  
  ##
  # Generic class to create a graph node
  class Node 
    
    attr_accessor :name
    
    def initialize(name)
      @name = name
    end
    
    def == (node)
      node && (@name == node.name)
    end
    
  end
  
end