require 'spec_helper'

describe "suggestions/new.html.erb" do
  before(:each) do
    assign(:suggestion, stub_model(Suggestion,
      :title => "MyString",
      :description => "MyText",
      :link => "MyString"
    ).as_new_record)
  end

  it "renders new suggestion form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => suggestions_path, :method => "post" do
      assert_select "input#suggestion_title", :name => "suggestion[title]"
      assert_select "textarea#suggestion_description", :name => "suggestion[description]"
      assert_select "input#suggestion_link", :name => "suggestion[link]"
    end
  end
end
