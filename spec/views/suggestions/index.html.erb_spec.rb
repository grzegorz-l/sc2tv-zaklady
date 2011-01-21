require 'spec_helper'

describe "suggestions/index.html.erb" do
  before(:each) do
    assign(:suggestions, [
      stub_model(Suggestion,
        :title => "Title",
        :description => "MyText",
        :link => "Link"
      ),
      stub_model(Suggestion,
        :title => "Title",
        :description => "MyText",
        :link => "Link"
      )
    ])
  end

  it "renders a list of suggestions" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Link".to_s, :count => 2
  end
end
