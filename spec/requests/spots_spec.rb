require 'rails_helper'

RSpec.describe "Spots", type: :request do
  describe "現場検索" do
    it "正常に一覧を表示する" do
      get search_spots_path
      expect(response).to have_http_status(200)
    end
    
    
  end
end
