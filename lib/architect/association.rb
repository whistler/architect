require 'edge'
require 'graphviz'

module Architect
  
  class Association < Edge
    
    attr_accessor :attributes, :graph

    # TYPES = {
    #   ">": "vee",
    #   "": "none",
    #   "<>": "odiamond",
    #   "+": "odiamond",
    #   "++": "diamond"
    # }
    # 
    def initialize(node1, node2, markup="->")
      super node1, node2
      @attributes = parse_markup(markup)
    end
    
    def parse_markup(markup)
      {arrowhead: "none"}
    end
    
    def graph(g)
      g.add_edges(@node1.graphnode, @node2.graphnode, @attributes)
    end
    
  end
  
end