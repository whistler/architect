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
      elements = parser.parse(diagram)
      graph = GraphViz.new("ClassDiagram", type: "digraph")
      elements.each do |element|
        element.graph(graph)
      end
      graph.output(png: output)
    end
    
  end
end