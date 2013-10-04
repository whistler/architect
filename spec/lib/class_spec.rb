require 'spec_helper'
require 'class'

describe Architect::Class do
  
  it "should parse class name from markup" do
    class_ = Architect::Class.new("User")
    class_.name.should == "User"
  end
  
  it "should parse attributes and methods" do
    class_ = Architect::Class.new("User|+Firstname;+Lastname;+HashedPassword;-Salt|Login();Logout()")
    class_.name.should == "User"
    class_.markup.should == "{User|+Firstname\\n+Lastname\\n+HashedPassword\\n-Salt|Login()\\nLogout()}"
  end
  
end