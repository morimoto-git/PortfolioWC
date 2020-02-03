require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前とメールアドレスとパスワードがあれば登録できる" do
    expect(FactoryBot.create(:user)).to be_valid
  end

  it "名前がなければ登録できない" do
    expect(FactoryBot.build(:user, name: "")).to_not be_valid
  end

  it "メールアドレスがなければ登録できない" do
    expect(FactoryBot.build(:user, email: "")).to_not be_valid
  end

  it "メールアドレスが重複していたら登録できない" do
    user1 = FactoryBot.create(:user,name: "aikawa", email: "a@example.com")
    expect(FactoryBot.build(:user, name: "ishi", email: user1.email)).to_not be_valid
  end

  it "パスワードがなければ登録できない" do
    expect(FactoryBot.build(:user, password: "")).to_not be_valid
  end

  it "password_confirmationとpasswordが異なる場合保存できない" do
    expect(FactoryBot.build(:user,password:"password",password_confirmation: "passward")).to_not be_valid
  end

  describe 'アソシエーション' do
  	context 'Gameモデルとの関係' do
  	  it "1:Nとなっている" do
  	  	expect(User.reflect_on_association(:games).macro).to eq :has_many
  	  end
  	end
  	context 'Commentモデルとの関係' do
  	  it "1:Nとなっている" do
  	  	expect(User.reflect_on_association(:comments).macro).to eq :has_many
  	  end
  	end
  	context 'Favoriteモデルとの関係' do
  	  it "1:Nとなっている" do
  	  	expect(User.reflect_on_association(:favorites).macro).to eq :has_many
  	  end
  	end
  	context 'Active_notificationモデルとの関係' do
  	  it "1:Nとなっている" do
  	  	expect(User.reflect_on_association(:active_notifications).macro).to eq :has_many
  	  end
  	end
  	context 'Passive_notificationモデルとの関係' do
  	  it "1:Nとなっている" do
  	  	expect(User.reflect_on_association(:passive_notifications).macro).to eq :has_many
  	  end
  	end
  end
end