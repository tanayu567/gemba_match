require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'create' do         
      it '正常に登録できること' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
        user.save
      end

    describe '登録に失敗する' do
      it 'パスワードがない場合に登録失敗' do
        user = FactoryBot.build(:user)
        user.password = nil
        expect(user).to be_invalid
      end

      it '名前がない場合に登録失敗' do
        user = FactoryBot.build(:user)
        user.name = nil
        expect(user).to be_invalid
      end

      it 'パスワードがない場合に登録失敗' do
        user = FactoryBot.build(:user)
        user.password = nil
        expect(user).to be_invalid
      end
    end

  end
  
end
