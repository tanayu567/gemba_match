require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "assciation" do
    it 'Userとの関係' do
      expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
    end

    it 'Spotとの関係' do
      expect(Comment.reflect_on_association(:spot).macro).to eq :belongs_to
    end
  end
end
