require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user_params) { attributes_for(:user) }
  let(:invalid_user_params) { attributes_for(:user, email: '') }

  describe "GET /users/sign_up" do
    it "新規登録画面の表示に成功すること" do
      get new_user_registration_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do  
    context "パラメータが正常な場合" do            
      it 'リクエストが成功すること' do
        post user_registration_path, params: { user: user_params }
        expect(response.status).to eq 302
      end
  
      it 'createが成功すること' do
        expect {
          post user_registration_path, params: { user: user_params }
        }.to change(User, :count).by 1
      end
  
      it 'トップ画面へリダイレクトされること' do
        post user_registration_path, params: { user: user_params }
        expect(response).to redirect_to root_url
      end
    end

    context "パラメータが不正な場合" do     
      it 'リクエストが成功すること' do
        post user_registration_path, params: { user: user_params }
        expect(response.status).to eq 302
      end

      it 'createが失敗すること' do      
        expect{
          post user_registration_path, params: { user: invalid_user_params }
        }.to_not change(User, :count)
      end

      it 'エラーが表示されること' do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response.body).to include 'error'
      end
    end
    
  end

  describe "GET /users/sign_in" do
   it 'ログイン画面が表示される' do
    get new_user_session_path
    expect(response).to have_http_status(200)
   end
  end

  describe "ログイン" do
    it "ログインに成功する" do
      post user_session_path, params: { user: user_params }
      expect(response).to have_http_status(200)
    end 
  end
  
end
