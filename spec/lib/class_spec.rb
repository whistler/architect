require 'spec_helper'
require 'class'

describe Architect::Class do
  
  it "should parse class name from markup" do
    class_ = Architect::Class.new("User")
    class_.name.should == "User"
  end
  
end