require 'spec_helper'

describe SuggestionsController do

  def mock_suggestion(stubs={})
    (@mock_suggestion ||= mock_model(Suggestion).as_null_object).tap do |suggestion|
      suggestion.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all suggestions as @suggestions" do
      Suggestion.stub(:all) { [mock_suggestion] }
      get :index
      assigns(:suggestions).should eq([mock_suggestion])
    end
  end

  describe "GET show" do
    it "assigns the requested suggestion as @suggestion" do
      Suggestion.stub(:find).with("37") { mock_suggestion }
      get :show, :id => "37"
      assigns(:suggestion).should be(mock_suggestion)
    end
  end

  describe "GET new" do
    it "assigns a new suggestion as @suggestion" do
      Suggestion.stub(:new) { mock_suggestion }
      get :new
      assigns(:suggestion).should be(mock_suggestion)
    end
  end

  describe "GET edit" do
    it "assigns the requested suggestion as @suggestion" do
      Suggestion.stub(:find).with("37") { mock_suggestion }
      get :edit, :id => "37"
      assigns(:suggestion).should be(mock_suggestion)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created suggestion as @suggestion" do
        Suggestion.stub(:new).with({'these' => 'params'}) { mock_suggestion(:save => true) }
        post :create, :suggestion => {'these' => 'params'}
        assigns(:suggestion).should be(mock_suggestion)
      end

      it "redirects to the created suggestion" do
        Suggestion.stub(:new) { mock_suggestion(:save => true) }
        post :create, :suggestion => {}
        response.should redirect_to(suggestion_url(mock_suggestion))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved suggestion as @suggestion" do
        Suggestion.stub(:new).with({'these' => 'params'}) { mock_suggestion(:save => false) }
        post :create, :suggestion => {'these' => 'params'}
        assigns(:suggestion).should be(mock_suggestion)
      end

      it "re-renders the 'new' template" do
        Suggestion.stub(:new) { mock_suggestion(:save => false) }
        post :create, :suggestion => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested suggestion" do
        Suggestion.should_receive(:find).with("37") { mock_suggestion }
        mock_suggestion.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :suggestion => {'these' => 'params'}
      end

      it "assigns the requested suggestion as @suggestion" do
        Suggestion.stub(:find) { mock_suggestion(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:suggestion).should be(mock_suggestion)
      end

      it "redirects to the suggestion" do
        Suggestion.stub(:find) { mock_suggestion(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(suggestion_url(mock_suggestion))
      end
    end

    describe "with invalid params" do
      it "assigns the suggestion as @suggestion" do
        Suggestion.stub(:find) { mock_suggestion(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:suggestion).should be(mock_suggestion)
      end

      it "re-renders the 'edit' template" do
        Suggestion.stub(:find) { mock_suggestion(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested suggestion" do
      Suggestion.should_receive(:find).with("37") { mock_suggestion }
      mock_suggestion.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the suggestions list" do
      Suggestion.stub(:find) { mock_suggestion }
      delete :destroy, :id => "1"
      response.should redirect_to(suggestions_url)
    end
  end

end
