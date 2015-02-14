require 'rails_helper'

RSpec.describe ExternalDataController, :type => :controller do

  describe "GET pulldata" do
    it "returns http success" do
      get :pulldata
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET pushdata" do
    it "returns http success" do
      get :pushdata
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET displaydata" do
    it "returns http success" do
      get :displaydata
      expect(response).to have_http_status(:success)
    end
  end

end
