require 'rails_helper'

describe 'user', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ユーザーがログインしていないとき' do
    it 'ユーザー一覧ページに遷移せずログインページに遷移する' do
      visit users_path
      expect(current_path).to eq(new_user_session_path)
    end
    it 'マイページに遷移せずログインページに遷移する' do
      visit user_path(@user)
      expect(current_path).to eq(new_user_session_path)
    end
    it '会員情報編集ページに遷移せずログインページに遷移する' do
      visit edit_user_path(@user)
      expect(current_path).to eq(new_user_session_path)
    end
  end

  context 'ユーザーがログインしているとき' do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      click_button 'ログイン'
    end
    it 'ユーザー一覧ページが正しく表示される' do
      visit users_path
      expect(page).to have_content @user.name
    end
    it 'マイページが正しく表示される' do
      visit user_path(@user)
      expect(page).to have_content @user.name
    end
    it '会員情報編集ページが正しく表示される' do
      visit edit_user_path(@user)
      expect(page).to have_content @user.name
    end
  end
end