require "spec_helper"

describe Duel do
  it "has none to begin with" do
    Duel.count.should == 0
  end

  it "has one after adding one" do
    Duel.create
    Duel.count.should == 1
  end

  it "has none after one was created in a previous example" do
    Duel.count.should == 0
  end
end