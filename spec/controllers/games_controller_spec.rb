require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  before do
    @game = FactoryBot.create(:game)
  end

  it 'FactoryBotが有効か' do
    game = @game
    expect(game).to be_valid
  end

  context "投稿一覧ページが正しく表示される" do
    before do
      get :index
    end
    it 'リクエストは200 OKとなること' do
      expect(response.status).to eq 200
    end
  end

end