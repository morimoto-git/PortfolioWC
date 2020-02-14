require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'バリデーションのテスト' do
    let!(:game) { FactoryBot.create(:game) }

    context 'ゲーム名' do
      it 'ゲーム名がなければ登録できない' do
        game.title = ''
        expect(game).to_not be_valid
      end
      it '41文字以上なら登録できない' do
        game.title = 'a' * 41
        expect(game).to_not be_valid
      end
    end

    context 'ゲーム説明' do
      it 'ゲーム説明がなければ登録できない' do
        game.content = ''
      end
      it '201文字以上なら登録できない' do
        game.content = 'a' * 201
        expect(game).to_not be_valid
      end
    end

    it 'カテゴリーがなければ登録できない' do
      game.category_id = ''
      expect(game).to_not be_valid
    end
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
      it '1:Nとなっている' do
        expect(Game.reflect_on_association(:game_rules).macro).to eq :has_many
      end
    end
  	context 'Commentモデルとの関係' do
  	  it '1:Nとなっている' do
  	  	expect(Game.reflect_on_association(:comments).macro).to eq :has_many
  	  end
  	end
  	context 'Favoriteモデルとの関係' do
  	  it '1:Nとなっている' do
  	  	expect(Game.reflect_on_association(:favorites).macro).to eq :has_many
  	  end
  	end
  	context 'Notificationモデルとの関係' do
  	  it '1:Nとなっている' do
  	  	expect(Game.reflect_on_association(:notifications).macro).to eq :has_many
  	  end
  	end
  end
end