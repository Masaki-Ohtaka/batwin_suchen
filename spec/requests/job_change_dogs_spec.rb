require 'rails_helper'

RSpec.describe "JobChangeDogs", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/job_change_dogs/index"
      expect(response).to have_http_status(:success)
    end
  end

end
