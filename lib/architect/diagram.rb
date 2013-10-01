require 'parser'

module Architect
  ##
  # Diagram is the base class for generating any diagram. 
  class Diagram
    # Draw
    # [diagram] string containing the markup of the diagram
    def draw(diagram)
      parser = Architect::Parser.new
      nodes, edges = parser.parse(diagram)
    end
    
  end
end