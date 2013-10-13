require_relative 'class'
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
      pattern = /\[(?<class1>.+?)\](?<association>.+?)\[(?<class2>.+)\]/ 
      tokens = pattern.match(statement)
      if tokens
        class1 = Class.new(tokens[:class1])
        class2 = Class.new(tokens[:class2])
        association = Association.new(class1, class2, tokens[:association])
        return [class1, class2, association]
      else
        tokens = /\[(?<class1>.*)\]/.match(statement)
        class1 = Class.new(tokens[:class1])
        return [class1]
      end
    end
  end
end