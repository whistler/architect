require 'node'

module Architect
  
  class Class < Architect::Node
    
    def initialize(markup)
      @name = markup
      @attributes = {shape: "record"}
    end
    
    def graph(g)
      g.add_nodes(@name, @attributes)
    end
    
  end
  
end