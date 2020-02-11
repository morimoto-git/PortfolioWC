# require 'rails_helper'

# describe 'ユーザー', type: :system do
#   before do
#     user = FactoryBot.create(:user)

#     visit new_user_session_path
#     fill_in 'メールアドレス', with: 'test@example.com'
#     fill_in 'パスワード', with: 'password'
#     click_button 'ログイン'
#   end

#   context "管理者ユーザーがログインしているとき" do

#     it 'ユーザー一覧ページが正しく表示される' do
#       expect(page).to have_content 'ユーザーページ'
#     end
#   end
# end