require 'rails_helper'

RSpec.describe Game, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'FactoryBotが有効か' do
    user = @user
    expect(user).to be_valid
  end

  describe 'アソシエーション' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Game.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  	context 'Categoryモデルとの関係' do
  	  it "1:Nとなっている" do
  	  	expect(Game.reflect_on_association(:category).macro).to eq :belongs_to
  	  end
  	end
    context 'Game_ruleモデルとの関係' do
      it "1:Nとなっている" do
        expect(Game.reflect_on_association(:game_rules).macro).to eq :has_many
      end
    end
  	context 'Commentモデルとの関係' do
  	  it "1:Nとなっている" do
  	  	expect(Game.reflect_on_association(:comments).macro).to eq :has_many
  	  end
  	end
  	context 'Favoriteモデルとの関係' do
  	  it "1:Nとなっている" do
  	  	expect(Game.reflect_on_association(:favorites).macro).to eq :has_many
  	  end
  	end
  	context 'Notificationモデルとの関係' do
  	  it "1:Nとなっている" do
  	  	expect(Game.reflect_on_association(:notifications).macro).to eq :has_many
  	  end
  	end
  end
end