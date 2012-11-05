require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe As::StoriesController do

  # This should return the minimal set of attributes required to create a valid
  # As::Story. As you add validations to As::Story, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {  }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # As::StoriesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all as_stories as @as_stories" do
      story = As::Story.create! valid_attributes
      get :index, {}, valid_session
      assigns(:as_stories).should eq([story])
    end
  end

  describe "GET show" do
    it "assigns the requested as_story as @as_story" do
      story = As::Story.create! valid_attributes
      get :show, {:id => story.to_param}, valid_session
      assigns(:as_story).should eq(story)
    end
  end

  describe "GET new" do
    it "assigns a new as_story as @as_story" do
      get :new, {}, valid_session
      assigns(:as_story).should be_a_new(As::Story)
    end
  end

  describe "GET edit" do
    it "assigns the requested as_story as @as_story" do
      story = As::Story.create! valid_attributes
      get :edit, {:id => story.to_param}, valid_session
      assigns(:as_story).should eq(story)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new As::Story" do
        expect {
          post :create, {:as_story => valid_attributes}, valid_session
        }.to change(As::Story, :count).by(1)
      end

      it "assigns a newly created as_story as @as_story" do
        post :create, {:as_story => valid_attributes}, valid_session
        assigns(:as_story).should be_a(As::Story)
        assigns(:as_story).should be_persisted
      end

      it "redirects to the created as_story" do
        post :create, {:as_story => valid_attributes}, valid_session
        response.should redirect_to(As::Story.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved as_story as @as_story" do
        # Trigger the behavior that occurs when invalid params are submitted
        As::Story.any_instance.stub(:save).and_return(false)
        post :create, {:as_story => {  }}, valid_session
        assigns(:as_story).should be_a_new(As::Story)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        As::Story.any_instance.stub(:save).and_return(false)
        post :create, {:as_story => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested as_story" do
        story = As::Story.create! valid_attributes
        # Assuming there are no other as_stories in the database, this
        # specifies that the As::Story created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        As::Story.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => story.to_param, :as_story => { "these" => "params" }}, valid_session
      end

      it "assigns the requested as_story as @as_story" do
        story = As::Story.create! valid_attributes
        put :update, {:id => story.to_param, :as_story => valid_attributes}, valid_session
        assigns(:as_story).should eq(story)
      end

      it "redirects to the as_story" do
        story = As::Story.create! valid_attributes
        put :update, {:id => story.to_param, :as_story => valid_attributes}, valid_session
        response.should redirect_to(story)
      end
    end

    describe "with invalid params" do
      it "assigns the as_story as @as_story" do
        story = As::Story.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        As::Story.any_instance.stub(:save).and_return(false)
        put :update, {:id => story.to_param, :as_story => {  }}, valid_session
        assigns(:as_story).should eq(story)
      end

      it "re-renders the 'edit' template" do
        story = As::Story.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        As::Story.any_instance.stub(:save).and_return(false)
        put :update, {:id => story.to_param, :as_story => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested as_story" do
      story = As::Story.create! valid_attributes
      expect {
        delete :destroy, {:id => story.to_param}, valid_session
      }.to change(As::Story, :count).by(-1)
    end

    it "redirects to the as_stories list" do
      story = As::Story.create! valid_attributes
      delete :destroy, {:id => story.to_param}, valid_session
      response.should redirect_to(as_stories_url)
    end
  end

end
