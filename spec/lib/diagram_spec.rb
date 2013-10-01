require 'spec_helper'
require 'diagram'

describe Architect::Diagram do
  
  before(:each) do
    @diagram = Architect::Diagram.new
  end
  
  it "can draw a class" do
    @diagram.send("draw", "[User]")
  end
  
end