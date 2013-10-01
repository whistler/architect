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
  
end