require_relative 'node'

module Architect
  
  # This is a generic edge in a graph which connects two nodes
  class Edge
    attr_accessor :from, :to
    
    def initialize(node1, node2)
      raise node1.to_s + " must be a Node" unless node1.kind_of? Node 
      raise node2.to_s + " must be a Node" unless node2.kind_of? Node 
      @node1 = node1
      @node2 = node2
    end
    
  end
  
end