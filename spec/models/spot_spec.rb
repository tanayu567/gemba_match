require 'rails_helper'

RSpec.describe Spot, type: :model do
  before do
    @user = FactoryBot.build(:user)  
  end
  describe "create" do
    it "正常に投稿できる" do
      user = @user
      spot = user.spots.build(
        s_name: 'テスト工事',
        address: '東京都',
        start: '2021/6/16',
        last: '2021/12/16',
        money: '100,000',       
      )
      expect(spot).to be_valid
    end
    
    describe "投稿に失敗する" do    
      subject(:spot) { FactoryBot.build(:spot) }
      it 'user_idがない場合に投稿失敗' do        
        expect(spot).to be_invalid
      end

      it "現場名がない場合に投稿失敗" do
        spot.s_name = nil
        expect(spot).to be_invalid
      end     
    end    
  end

  describe "association" do
    it 'Userとの関係' do
      expect(Spot.reflect_on_association(:user).macro).to eq :belongs_to
    end

    it 'likesとの関係' do
      expect(Spot.reflect_on_association(:likes).macro).to eq :has_many
    end

    it 'commentsとの関係' do
      expect(Spot.reflect_on_association(:comments).macro).to eq :has_many
    end
    
  end
  
end
