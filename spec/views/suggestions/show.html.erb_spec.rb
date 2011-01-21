require 'spec_helper'

describe "suggestions/show.html.erb" do
  before(:each) do
    @suggestion = assign(:suggestion, stub_model(Suggestion,
      :title => "Title",
      :description => "MyText",
      :link => "Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Link/)
  end
end
