require 'rails_helper'

RSpec.describe "Spots", type: :request do
  describe "search" do
    it "正常に一覧を表示する" do
      get search_spots_path
      expect(response).to have_http_status(200)
      expect(response.body).to include '検索結果一覧'
    end 
  end      
end
