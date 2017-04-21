require 'rails_helper'
begin
  UsersController
rescue
  UsersController = nil
end

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "redirects to goals page" do
        post :create, params: { user: { email: "email1", password: "password"} }
        expect(response).to redirect_to(goals_url)
      end
    end

    context "with invalid params" do
      it "redirects to new user" do
        post :create, params: { user: { email: "email1"} }
        expect(response).to redirect_to(new_user_url)
      end
    end
  end
end
