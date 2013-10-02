require 'node'

module Architect
  
  ###
  # This is a generic edge in a graph which connects two nodes
  class Edge
    attr_accessor :node1, :node2, :direction
    
    def initialize(node1, node2, direction = :both)
      raise node1 + " must be a Node" if node1.class != Architect::Node 
      raise node2 + " must be a Node" if node2.class != Architect::Node 
      if not [:forward,:reverse,:both].include?(direction)
        raise direction + " must be :forward, :reverse or :both" 
      end
      @node1 = node1
      @node2 = node2
      @direction = direction
    end
    
  end
  
end