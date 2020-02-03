require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe '投稿一覧ページ' do
    context "投稿一覧ページが正しく表示される" do
      before do
        get :index
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end

  # describe '投稿詳細ページ' do
  #   context "投稿詳細ページが正しく表示される" do
  #     before do
  #       get :new
  #     end
  #     it 'リクエストは200 OKとなること' do
  #       expect(response.status).to eq 200
  #     end
  #   end
  # end
end