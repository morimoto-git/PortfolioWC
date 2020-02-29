# README

## Name
**ur game**  
オリジナルのアナログゲームを閲覧・投稿できるアプリケーション  
※urはyourの略語  
URL:http://urgame.net/  

## Features
主な機能  

・投稿機能  
ログイン時、ヘッダーの「投稿する」から新規投稿可能  
以下投稿手順  
1.ゲーム名、ゲーム説明、ルールのテキスト（ルールを掲載する場合）を記載　※必須  
2.カテゴリー、プレイ人数、プレイ時間、推奨年齢を選択  
3.メイン画像、ルールごとの画像を掲載　※任意  
4.投稿するボタンをクリック  

・いいね、コメント、フォロー機能  
ログイン時のみ各投稿に関して、  
投稿一覧・詳細ページからいいねが可能  
投稿詳細ページからコメントが可能  
他ユーザーページからフォローが可能  
※投稿一覧へはヘッダーの「ゲーム」から遷移  
※投稿詳細へは各ページのゲーム名のリンクから遷移  

・通知機能  
ログイン時のみヘッダーの「通知」から確認可能  
※通知の有無で記載が変更  
以下通知内容  
1.他ユーザーの自分の投稿に対するいいね  
2.他ユーザーの自分の投稿に対するコメント  
3.自分がコメントした投稿に対する他ユーザーのコメント  

・非ログイン時  
投稿一覧・投稿詳細・ランキングの閲覧、投稿検索のみ可能  

## Dependencies/Technologies
ruby 2.5.7  
Rails 5.2.4  
jQuery  
Bootstrap4  
mysql2  

## Gem
devise  
refile  
refile-mini_magick  
cocoon  
dotenv-rails  
chart-js-rails  
kaminari  
pry-byebug  
rspec-rails  
factory_bot_rails  

## Installation
git clone https://github.com/morimotohirotomo/portfolio  
bundle install  
rails db:migrate  
rails s  

## Application/Web server
puma/nginx

## Author
Hirotomo Morimoto