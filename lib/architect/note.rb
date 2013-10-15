module Architect
  
  # A note in a class diagram
  class Note < Architect::Node
    attr_accessor :graphnode
    
    def initialize(markup)
      matches = /note:(.+)/i.match(markup)
      @markup = matches[1].strip
      @style = {shape: "note", style: "filled", fillcolor: "lightgrey"}
    end
    
    def graph(g)
       @graphnode = g.add_nodes(@markup, @style)
    end
  end
end