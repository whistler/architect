require 'pry'
module Architect
  
  ##
  # Parses yUML files
  class Parser
    # [diagram] string containing yUML markup
    def parse(diagram)
      statements = get_statements(diagram)
    end
    
    # Returns a list of statments
    # [diagram] string containing yUML markup
    def get_statements(diagram)
      statements = diagram.split(/\][,\s]*\[/) # split on "]*["
      
      #insert removed square brackets
      statements = statements.each_with_index.map do |statement, i|
        statement = statement.strip
        statement = "[" + statement if statement[0] != "["
        statement = statement + "]" if statement[-1] != "]"
        statement
      end
      return statements
    end
  end
end