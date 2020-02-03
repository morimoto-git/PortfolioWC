require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'トップページ' do
    context "投稿一覧ページが正しく表示される" do
      before do
        get :top
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end
  describe 'アバウトページ' do
    context "アバウトページが正しく表示される" do
      before do
        get :about
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end
end