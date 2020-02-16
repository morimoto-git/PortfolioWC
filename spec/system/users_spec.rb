require 'rails_helper'

describe 'user', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user, name: '一般ユーザー', email: 'test2@example.com', password: 'password', admin: false)
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

  describe '管理者ユーザーがログインしているとき' do
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

    context 'マイページの表示' do
      before do
        visit user_path(@user)
      end
      it 'マイページが正しく表示される' do
        expect(page).to have_content @user.name
      end
      it 'カテゴリーリンクが表示される' do
        expect(page).to have_content 'カテゴリー一覧'
      end
      it 'ユーザー一覧リンクが表示される' do
        expect(page).to have_content 'ユーザー一覧'
      end
    end

    it '会員情報編集ページが正しく表示される' do
      visit edit_user_path(@user)
      expect(page).to have_content @user.name
    end
  end

  describe '一般ユーザーがログインしているとき' do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user2.email
      fill_in 'パスワード', with: @user2.password
      click_button 'ログイン'
    end

    it 'ユーザー一覧ページに遷移せずトップページに遷移する' do
      visit users_path
      expect(current_path).to eq(root_path)
    end

    context 'マイページ' do
      before do
        visit user_path(@user2)
      end
      it 'マイページが正しく表示される' do
        expect(page).to have_content @user2.name
      end
      it 'カテゴリーリンクが表示されない' do
        expect(page).to have_no_content 'カテゴリー一覧'
      end
      it 'ユーザー一覧リンクが表示されない' do
        expect(page).to have_no_content 'ユーザー一覧'
      end
    end
  end
end