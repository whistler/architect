require 'spec_helper'
require 'diagram'

describe Architect::Diagram do
  
  before(:each) do
    @diagram = Architect::Diagram.new
  end
  
  it "can draw a class" do
    @diagram.send("draw", "[User]", "class.svg")
  end
  
  it "can draw an association" do
    @diagram.send("draw", "[User]-[Pet]", "association.svg")
  end
  
  it "can draw a class with attributes and methods" do
    @diagram.send("draw", "[User|name; age; height|login(); logout()]-[Pet]", "record.svg")    
  end
  
  it "can draw a diagram with composition" do
    @diagram.send("draw", "[Pond]<>0..1-0..*[Duck]", "composition.svg")
  end
  
  it "can draw a note" do
    @diagram.send("draw", "[note: This is a note about user]-.-[User]\n[note: this is a note]", "note.svg")
  end
  
end