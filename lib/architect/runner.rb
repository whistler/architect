require 'architect/diagram'

module Architect
  
  class Runner
    
    def initialize(file, ext)
      @drawer = Architect::Diagram.new()
      diagram = Kernel.open(file).read()
      output_file = change_extension(file, ext)
      @drawer.draw(diagram, output_file)
    end
    
    def change_extension(file, new_ext)
      ext = File.extname(file).gsub(".","")
      return file.gsub(ext, new_ext)
    end
    
  end
end
