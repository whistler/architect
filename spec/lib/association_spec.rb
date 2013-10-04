require 'spec_helper'
require 'association'
require 'class'

describe Architect::Association do
  
  it "should parse simple association" do
    node = Architect::Class.new("[User]")
    association = Architect::Association.new(node, node, "-")
    association.attributes[:arrowhead] = "none"
  end
  
end