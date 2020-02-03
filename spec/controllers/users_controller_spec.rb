# require 'rails_helper'

# RSpec.describe UsersController, type: :controller do
#   before do
#     user = FactoryBot.create(:user)
#   end

#   before do
#     sign_in user
#   end

#   context "ユーザー一覧ページが正しく表示される" do
#     before do
#       get :index
#     end
#     it 'リクエストは200 OKとなること' do
#       expect(response.status).to eq 200
#     end
#   end
#   context "マイページが正しく表示される" do
#     before do
#       get :show
#     end
#     it 'リクエストは200 OKとなること' do
#       expect(response.status).to eq 200
#     end
#   end
# end