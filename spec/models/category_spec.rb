require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'バリデーションのテスト' do
    let!(:category) { FactoryBot.create(:category) }

    context 'カテゴリー名' do
      it 'カテゴリー名がなければ登録できない' do
        category.name = ''
        expect(category).to_not be_valid
      end
      it '1文字なら登録できない' do
        category.name = 'a'
        expect(category).to_not be_valid
      end
      it '31文字以上なら登録できない' do
        category.name = 'a' * 31
        expect(category).to_not be_valid
      end
    end
  end

  describe 'アソシエーション' do
    context 'Gameモデルとの関係' do
      it '1:Nとなっている' do
        expect(Category.reflect_on_association(:games).macro).to eq :has_many
      end
    end
  end
end