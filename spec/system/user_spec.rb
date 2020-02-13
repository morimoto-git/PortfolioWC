require 'rails_helper'

describe 'user', type: :system do
  before do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'test@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  context "管理者ユーザーがログインしているとき" do

    it 'ユーザー一覧ページが正しく表示される' do
      visit users_path
      expect(page).to have_content 'ID'
    end
  end
end