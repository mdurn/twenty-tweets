require 'spec_helper'

describe TweetsController do
  let(:user) {Fabricate(:user)}

  describe "GET 'overview'" do
    it "returns http success" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
      get 'overview'
      response.should be_success
    end
  end

  describe "GET 'user'" do
    it "returns http success" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
      get 'user', screen_name: 'mdurntest'
      response.should be_success
    end
  end

end
