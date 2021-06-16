require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'create' do         
      it '正常に登録できること' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
        user.save
      end

    describe '登録に失敗する' do
      subject(:user) { FactoryBot.build(:user) }
      it 'メールアドレスがない場合に登録失敗' do
        user.email = nil
        expect(user).to be_invalid
      end

      it 'メールアドレスが重複している場合に登録失敗' do
        FactoryBot.create(:user, email: 'test@gmail.com' )
        user.email = 'test@gmail.com'
        expect(user).to be_invalid
      end
      
      it 'メールアドレスが無効の場合に登録失敗' do
        user.email = 'absdefghijklmn'
        expect(user).to be_invalid
      end

      it '名前がない場合に登録失敗' do
        user.name = nil
        expect(user).to be_invalid
      end

      it 'パスワードがない場合に登録失敗' do
        user.password = nil
        user.password_confirmation = nil
        expect(user).to be_invalid
      end

      it 'パスワードが5文字以下の時に登録失敗' do
        user.password = 'a' * 5
        user.password_confirmation = 'a' * 5
        expect(user).to be_invalid
      end

      it '資格欄が500文字より多いと失敗' do
        user.license = 'a' * 501
        expect(user).to be_invalid
      end
    end
  end 
end
