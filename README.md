# 現場マッチ
工事現場とそこで作業する職人さんをマッチさせるためのサービスです。  
職人が足りない現場、仕事を探している職人の両方が存在している現状を解決するべく開発いたしました。

![gemba_match](https://user-images.githubusercontent.com/81660388/130314344-dc39beb2-de3c-45b2-904f-8899b7dbbe7e.png)

サイトURL https://gemba-match.com/  
ヘッダー部分の「ゲストログイン(閲覧用)」よりログインできます。

# 使用技術
## フロントエンド
・HTML  
・CSS  
・JavaScript  
・Bootstrap 4.3.1  
・JQuery 3.6.0  
## バックエンド
・Ruby 2.6.3  
・Ruby on Rails 6.1.4  
・MySQL 5.7  
・Rubocop(コード解析ツール)  
・RspecRspec(テスト)  
## インフラ
・AWS(VPC/EC2/RDS/ALB/S3/ACM/Route53)  
・Nginx  
・Puma  
・CircleCI(CI/CD)  
・Capistrano  
## 開発環境
・VSCode  
・Git/GitHub  
・Docker/Docker-Compose  
## ER図
![現場マッチ 改](https://user-images.githubusercontent.com/81660388/130374087-42a17ae3-a96f-44d6-b753-32aa389b7aa9.png)
## インフラ構成図
![インフラ構成図](https://user-images.githubusercontent.com/81660388/130374118-a724a0b2-7497-405a-b8d7-e456a20ea064.png)
## 機能一覧
【ユーザー登録】  
・「職人」「事業所」の２通りのユーザー登録機能  
【ユーザー情報編集】  
・プロフィール画像等のユーザー情報を編集する機能  
【ゲストログイン機能】  
・ゲストとしてログインし「職人」「事業所」の両方の機能を使用可能  
【現場投稿機能】  
・「事業所」ユーザーが「現場」を投稿する機能  
【コンテンツ一覧】  
・トップページにて「現場」と「職人」の新着一覧を表示  
【コンテンツ詳細】  
・ユーザー詳細や投稿された「現場」の詳細を表示可能  
【「コメント」「いいね」機能】  
・投稿された「現場」の詳細ページにてユーザーがコメントやいいねをする機能(非同期通信/Ajax)  
【フォロー機能】  
・気になったユーザーをフォローする機能  
【検索機能】  
・「職人」ユーザーは「現場名」「現場住所」「工期」「金額」いずれかの情報を入力して「現場」を検索できる機能  
・「事業所」は「職人名」「経験年数」「活動エリア」「資格etc」いずれかの情報を入力して「職人」を検索できる機能  
【DM機能】  
・相互フォローとなったユーザー同士でDMができる機能(websocketによる双方向通信)  


**■サービス概要**  
「建設現場における現場と職人のマッチングアプリ」

工事現場とそこで作業する職人さんをマッチさせるためのサービス  
事業所は自身が工事する現場の概要を投稿し、職人さんは自信の能力を投稿する。  
気に入った現場及び職人さんがあればコメントやDMでマッチしていくというシステムです。  

**■開発背景**  
私自身が建設業で仕事をした経験があり、建設業では人手不足が深刻化しており  
私もそれを問題視する一人でした。  
しかし工事現場では人手が足りていないものの、職人さんがみんな仕事を抱えているか  
というとそうでもない事も多々ありました。  
現場の管理者と実際に仕事を探している職人さんが繋がっていないのが現状でした。  
そこでツールを通して現場と職人さんをマッチさせることが出来れば人手不足を  
和らげることができると考えこのサービスの開発に手を掛けました。 

## 工夫した点  
・シンプルなUI/UXにより操作を簡単かつわかりやすくした  
・実務での開発を意識し開発環境はDockerを導入した  
・CircleCによるCI／CDの導入  
・インフラはHerokuではなくAWSを導入