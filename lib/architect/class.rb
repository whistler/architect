require 'node'

module Architect
  
  class Class < Architect::Node
    
    attr_accessor :graphnode, :markup
    
    def initialize(markup)
      if markup.index("|").nil?
        @name = markup
      else
        tokens = /^(?<name>.+?)\|/.match(markup)
        @name = tokens[:name]
      end
      @markup = format(markup)
      @style = {shape: "record"}
    end
    
    def format(markup)
      return "{" + markup.gsub(";", "\\n") + "}"
    end
    
    def graph(g)
      @graphnode = g.add_nodes(@markup, @style)
    end
    
  end
  
end