require 'spec_helper'
require 'edge'

describe Architect::Edge do
  
  it "should connect two nodes" do
    node1 = Architect::Node.new("node1")
    edge = Architect::Edge.new(node1, node1)
  end
  
end