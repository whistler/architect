require 'spec_helper'
require 'parser'

describe Architect::Parser do
  
  before(:each) do
    @parser = Architect::Parser.new
  end
  
  it "can extract statements from markup" do
    test = <<-EOF
    [Company]<>-1>[Location],
    [Location]+->[Point][Customer]1-0..*[Address]
    [User][User|+Forename+;Surname;+HashedPassword;-Salt|+Login();+Logout()]
    EOF
    @parser.get_statements(test).count.should == 5
  end
  
  it "can extract a single class markup from statement" do
    classes = @parser.parse_statement("[User]")
    classes.size.should == 1
    classes[0].name == "User"
  end
  
  it "can extract two class and a relationship" do
    elements = @parser.parse_statement("[User]-[Cat]")
    elements.size.should == 3
    elements[0].name == "User"
  end
  
  it "can parse a note" do
    note = @parser.parse_statement("[Note: Hello]").first
    note.class == Architect::Note
  end
  
end