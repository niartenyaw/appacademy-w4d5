require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "renders login form" do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do

    User.create( email: "email1", password: "password" )

    context "with valid credentials" do
      it "redirects to goals homepage" do
        post :create, params: { user: { email: "email1", password: "password" } }

        expect(response).to redirect_to(goals_url)
      end
    end

    context "with invalid credentials" do
      it "redirects to login page" do
        post :create, params: { user: { email: "email1"} }

        expect(response).to redirect_to(new_sessions_url)
      end
    end
  end

  describe "DELETE #destroy" do
    it "logs the user out" do
      post :create, params: { user: { email: "email1", password: "password" } }
      delete :destroy

      expect(response).to redirect_to(goals_url)
    end
  end

end
