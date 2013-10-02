require 'parser'
require 'graphviz'

module Architect
  ##
  # Diagram is the base class for generating any diagram. 
  class Diagram
    # Draw
    # [diagram] string containing the markup of the diagram
    def draw(diagram, output = "class_diagram.png")
      parser = Architect::Parser.new
      nodes, edges = parser.parse(diagram)
      
      graph = GraphViz.new("ClassDiagram", type: "digraph")
      graph.add_nodes(nodes)
      graph.output(png: output)
    end
    
  end
end