require 'spec_helper'
require 'node'

describe Architect::Node do
  
  before(:each) do
    @node = Architect::Node.new("node1")
  end
  
  it "should have a name" do
    @node.name.should_not be_nil
  end
  
  it "should be equal to a node of the same name" do
    node = Architect::Node.new("node1")
    node.should == node
  end
  
end