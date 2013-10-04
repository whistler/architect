require 'spec_helper'
require 'diagram'

describe Architect::Diagram do
  
  before(:each) do
    @diagram = Architect::Diagram.new
  end
  
  it "can draw a class" do
    @diagram.send("draw", "[User]", "class.png")
  end
  
  it "can draw an association" do
    @diagram.send("draw", "[User]-[Pet]", "association.png")
  end
  
  it "can draw a class with attributes and methods" do
    @diagram.send("draw", "[User|name; age; height|login(); logout()]-[Pet]", "record.png")    
  end
  
end