require "spec_helper"

describe SuggestionsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/suggestions" }.should route_to(:controller => "suggestions", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/suggestions/new" }.should route_to(:controller => "suggestions", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/suggestions/1" }.should route_to(:controller => "suggestions", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/suggestions/1/edit" }.should route_to(:controller => "suggestions", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/suggestions" }.should route_to(:controller => "suggestions", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/suggestions/1" }.should route_to(:controller => "suggestions", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/suggestions/1" }.should route_to(:controller => "suggestions", :action => "destroy", :id => "1")
    end

  end
end
