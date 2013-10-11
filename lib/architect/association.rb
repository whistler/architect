require 'graphviz'
require_relative 'edge'

module Architect
  
  class Association < Edge
    
    attr_accessor :attributes, :graph

    TYPES = {
      "<>" => "odiamond",
      "+"  => "odiamond",
      "++" => "diamond",
      ""   => "none",
      ">"  => "vee"
    }
    
    def initialize(node1, node2, markup="->")
      super node1, node2
      @attributes = parse_markup(markup)
    end
    
    def parse_markup(markup)
      matches = /(.*)-(.*)/.match(markup)
      left = matches[1]
      right = matches[2]
      {arrowhead: get_arrow(right), arrowtail: get_arrow(left), 
       headlabel: " " + strip_arrow(right) + " ", 
       taillabel: " " + strip_arrow(left) + " ",
       dir: "both"}
    end
    
    def get_arrow(string)
      tokens = /([<>+]+)/.match(string)
      if tokens == nil
        return "none"
      else
        return TYPES[tokens[0]]
      end
    end
    
    def strip_arrow(string)
      return "" if string == nil
      TYPES.keys.each do |arrow|
        string = string.gsub(arrow, "")
      end
      return string
    end
    
    def graph(g)
      g.add_edges(@node1.graphnode, @node2.graphnode, @attributes)
    end
    
  end
  
end