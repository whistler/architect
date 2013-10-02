require 'pry'
module Architect
  
  ##
  # Parses yUML files
  class Parser
    
    # [diagram] String containing yUML markup
    # Returns list of classes and list of associations in diagram
    def parse(diagram)
      class_list = []
      association_list = []
      statements = get_statements(diagram)
      statements.each do |statement|
        classes, association = parse_statement(statement)
        class_list = class_list + classes
        association_list = association_list + [edge] if association
      end
      return class_list, association_list
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
      pattern = /\[(?<node1>.+)\](?<association>.*)?\[?(?<node2>.*)\]?/
      tokens = pattern.match(statement)
      if tokens[:node2] != ""
        return [tokens[:node1], tokens[:node2]], tokens[:association]
      else
        return [tokens[:node1]], nil
      end
    end
  end
end