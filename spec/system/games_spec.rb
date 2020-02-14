require 'rails_helper'

describe 'game', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @game = FactoryBot.create(:game, user: @user)
    visit new_user_session_path
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード', with: @user.password
    click_button 'ログイン'
  end

  it 'FactoryBotが有効か' do
    user = @user
    expect(user).to be_valid
  end

  it 'FactoryBotが有効か' do
    game = @game
    expect(game).to be_valid
  end

  context 'ページが正しく表示される' do
    it 'ゲーム一覧ページ' do
      visit games_path
      expect(page).to have_content 'プレイ時間'
    end
    it 'ゲーム詳細ページ' do
      visit game_path(@game)
      expect(page).to have_content 'プレイ時間'
    end
    it 'ゲーム投稿ページ' do
      visit new_game_path
      expect(page).to have_content 'プレイ時間'
    end
    it 'ゲーム編集ページ' do
      visit edit_game_path(@game)
      expect(page).to have_content 'プレイ時間'
    end
    it 'ランキングページ' do
      visit ranking_path
      expect(page).to have_content '投稿者'
    end
  end

end