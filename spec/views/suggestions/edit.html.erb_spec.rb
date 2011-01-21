require 'spec_helper'

describe "suggestions/edit.html.erb" do
  before(:each) do
    @suggestion = assign(:suggestion, stub_model(Suggestion,
      :new_record? => false,
      :title => "MyString",
      :description => "MyText",
      :link => "MyString"
    ))
  end

  it "renders the edit suggestion form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => suggestion_path(@suggestion), :method => "post" do
      assert_select "input#suggestion_title", :name => "suggestion[title]"
      assert_select "textarea#suggestion_description", :name => "suggestion[description]"
      assert_select "input#suggestion_link", :name => "suggestion[link]"
    end
  end
end
