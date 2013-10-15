require_relative 'class'
require_relative 'note'
require_relative 'association'

module Architect  
  
  # Parses yUML files
  class Parser
    
    # [diagram] String containing yUML markup
    # Returns list of classes and list of associations in diagram
    def parse(diagram)
      elements = []
      statements = get_statements(diagram)
      statements.each do |statement|
        new_elements = parse_statement(statement)
        elements = elements + new_elements
      end
      return elements
    end
    
    # [diagram] String containing yUML markup
    # Returns list of statments in diagram markup
    def get_statements(diagram)
      statements = diagram.split(/\][,\s]*\[/) # split on "]*["
      
      #insert removed square brackets back
      statements = statements.each_with_index.map do |statement, i|
        statement = statement.strip
        statement = "[" + statement if statement[0] != "["
        statement = statement + "]" if statement[-1] != "]"
        statement
      end
      return statements
    end
    
    # [statement] String containing statement
    # Returns a list of classes markup and association markup in the statement
    def parse_statement(statement)
      pattern = /\[(?<node1>.+?)\](?<association>.+?)\[(?<node2>.+)\]/ 
      tokens = pattern.match(statement)
      if tokens
        node1 = get_node(tokens[:node1])
        node2 = get_node(tokens[:node2])
        association = Association.new(node1, node2, tokens[:association])
        return [node1, node2, association]
      else
        tokens = /\[(?<node1>.*)\]/.match(statement)
        node1 = get_node(tokens[:node1])
        return [node1]
      end
    end
    
    # [markup] string containing content inside square brackets
    # Returns Note or Class
    def get_node(markup)
      if /^note/i.match(markup) != nil
        return Note.new(markup)
      else
        return Class.new(markup)
      end
    end
    
  end
end