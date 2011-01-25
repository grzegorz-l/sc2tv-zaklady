Given /^I have no posts$/ do
  Post.delete_all
end

Then /^I should have ([0-9]+) post$/ do |count|
  Post.count.should == count.to_i
end