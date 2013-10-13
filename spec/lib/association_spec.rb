require 'spec_helper'
require 'association'
require 'class'

describe Architect::Association do
  
  before(:each) do
    @node = Architect::Class.new("[User]")
    @association = Architect::Association.new(@node, @node, "-")
  end
  
  it "parses simple association" do
    attributes = @association.instance_eval("@attributes")
    attributes[:arrowhead].should == "none"
  end
  
  it "parses association markup" do
    dot = {arrowhead: "vee", arrowtail: "odiamond", 
     headlabel: " n ", taillabel: " 1 ", dir: "both", style: "solid"}
    @association.parse_markup("<>1-n>").should == dot
  end
  
  it "gets arrow from string" do
    @association.get_arrow("<>1").should == "odiamond"
  end
  
  it "strips arrows from strings" do
    @association.get_label(">1").should == "1"
  end
  
  it "can draw dashed and solid lines" do
    @association.get_linestyle("-").should == "solid"
    @association.get_linestyle("-.-").should == "dashed"
  end
  
end