require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryGirl.create(:user) }

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    # it { should validate_presence_of(:session_token) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:session_token) }
  end

  describe "associations"

  describe "class methods" do
    context "::find_by_credentials" do
      it "finds user by username and password" do
        search_user = User.find_by_credentials(user.email, "password")
        expect(search_user.id).to eq(user.id)
      end

      it "returns nil if user/password combination doesn't exist" do
        search_user = User.find_by_credentials(user.email, "password1")
        expect(search_user).to eq(nil)
      end
    end
  end
end
