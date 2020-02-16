FactoryBot.define do
  factory :user do
  	name { '管理者ユーザー' }
  	email { 'test@example.com' }
  	password { 'password' }
  	admin { true }
  end
end