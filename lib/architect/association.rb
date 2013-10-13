require 'graphviz'
require_relative 'edge'

module Architect
  
  ## Association between two classes
  class Association < Edge
    
    TYPES = {
      "<>" => "odiamond",
      "+"  => "odiamond",
      "++" => "diamond",
      ""   => "none",
      ">"  => "vee",
      "^"  => "empty"
    }
    
    def initialize(node1, node2, markup="->")
      super node1, node2
      @attributes = parse_markup(markup)
    end
    
    def parse_markup(markup)
      matches = /(.*)-\.-(.*)/.match(markup)
      matches = /(.*)-(.*)/.match(markup) if matches == nil
      left = matches[1]
      right = matches[2]
      style = get_linestyle(markup)
      {arrowhead: get_arrow(right), arrowtail: get_arrow(left), 
       headlabel: " " + get_label(right) + " ", 
       taillabel: " " + get_label(left) + " ",
       dir: "both", style: style}
    end
    
    # Return the type of arrow contained in the markup
    def get_arrow(string)
      tokens = /([<>+\^]+)/.match(string)
      if tokens == nil
        return "none"
      else
        return TYPES[tokens[0]]
      end
    end
    
    # Remove the arrow to get label
    def get_label(string)
      return "" if string == nil
      TYPES.keys.each do |arrow|
        string = string.gsub(arrow, "")
      end
      return string
    end
    
    def get_linestyle(string)
      if /-\.-/.match(string) == nil
        return "solid"
      else
        return "dashed"
      end
    end
    
    # Add associations to Graphviz
    def graph(g)
      g.add_edges(@node1.graphnode, @node2.graphnode, @attributes)
    end
    
  end
  
end