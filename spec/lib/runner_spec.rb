require 'spec_helper'
require 'runner'
require 'diagram'

describe Architect::Runner do
  
  it "should draw from file" do
    Architect::Diagram.any_instance.should_receive(:draw)
    Kernel.stub_chain(:open, :read).and_return("[User]")
    architect = Architect::Runner.new("tmp/example.yuml", 'png')
  end
  
  it "should be able to change extension" do
    Kernel.stub_chain(:open, :read).and_return("[User]")
    architect = Architect::Runner.new("test.yuml", "png")
    architect.send(:change_extension, "test.yuml", "png").should == "test.png"
  end
  
end