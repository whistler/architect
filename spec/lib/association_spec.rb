require 'spec_helper'
require 'association'
require 'class'

describe Architect::Association do
  
  before(:each) do
    @node = Architect::Class.new("[User]")
    @association = Architect::Association.new(@node, @node, "-")
  end
  
  it "parses simple association" do
    @association.attributes[:arrowhead].should == "none"
  end
  
  it "parses association markup" do
    dot = {arrowhead: "vee", arrowtail: "odiamond", 
     headlabel: "n", taillabel: "1", dir: "both"}
    @association.parse_markup("<>1-n>").should == dot
  end
  
  it "gets arrow from string" do
    @association.get_arrow("<>1").should == "odiamond"
  end
  
  it "strips arrows from strings" do
    @association.strip_arrow(">1").should == "1"
  end
  
end