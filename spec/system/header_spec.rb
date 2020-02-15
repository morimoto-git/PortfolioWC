require 'rails_helper'

describe 'ヘッダーのテスト' do
  describe 'ログインしていない場合' do
    before do
      visit root_path
    end
    context 'ヘッダーの表示を確認' do
      it 'サービスリンクが表示される' do
        expect(page).to have_content 'サービス'
      end
      it 'ゲームリンクが表示される' do
        expect(page).to have_content 'ゲーム'
      end
      it 'ランキングリンクが表示される' do
        expect(page).to have_content 'ランキング'
      end
      it 'ログインリンクが表示される' do
        expect(page).to have_content 'ログイン'
      end
      it 'サインアップリンクが表示される' do
        expect(page).to have_content 'サインアップ'
      end
    end
    context 'ヘッダーのリンクを確認' do
      it 'アバウトページに遷移する' do
        click_link 'サービス'
        expect(current_path).to eq(about_path)
      end
      it 'ゲーム一覧ページに遷移する' do
        click_link 'ゲーム'
        expect(current_path).to eq(games_path)
      end
      it 'ランキングページに遷移する' do
        click_link 'ランキング'
        expect(current_path).to eq(ranking_path)
      end
      it 'ログインページに遷移する' do
        click_link 'ログイン'
        expect(current_path).to eq(new_user_session_path)
      end
      it 'サインアップページに遷移する' do
        click_link 'サインアップ'
        expect(current_path).to eq(new_user_registration_path)
      end
    end
  end
end