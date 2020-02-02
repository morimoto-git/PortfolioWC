FactoryBot.define do
  factory :game do
  	user
  	category
  	title { 'テストゲーム' }
  	content { 'テストゲーム説明' }
  	player { 1 }
  	playing_time { 1 }
  	level { 1 }
  end
end