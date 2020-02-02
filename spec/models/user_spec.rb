require 'rails_helper'

RSpec.describe User, 'Userモデルに関するテスト', type: :model do
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