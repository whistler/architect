require 'spec_helper'
require 'note'

describe Architect::Note do
  it "can create note from markup" do
    note = Architect::Note.new("note: hello world")
    g = double()
    g.should_receive(:add_nodes).with("hello world", {style: "filled", 
      shape: "note", fillcolor: "lightgrey"})
    note.graph(g)
  end
end