# DIVE15 Ajaxによる非同期通信
point 
* ビュー内form_forの引数に```form_for([blog,comment], remote: true)```を入れる
* コントローラーのアクションにjsをレンダリングするコードをおく

```ruby
respond_to do |format|
  format.html{redirect_to blog_path(@blog), notice: 'コメントを投稿しました'}
  format.js { render :index }
end
```
* JSによる画面更新
```Javascript
$("#comments_area").html("<%= j(render 'comments/index', { comments: @comment.blog.comments, blog: @comment.blog }) %>")
$(':text').val('')
```


# DIVE16 フォロー機能
point 
* 多対多のアソシエーション
* 中間テーブルを介したアソシエーションを実装した際、フォロワー、フォローしている対象ユーザーは
```
user=User.first
user.followers #フォロワー
user.followed_users #フォローしている対象ユーザー
```
のように取得できる


# DIVE19_1 メッセージ機能
point
* 多対多のアソシエーション
* buildメソッドの復習
* 多数のentryを時系列で表示する際に最初の１０件のみ表示する
* ネストされたモデルをコントローラーで取得する
* before_action文にブロック構文を使用する
* テーブル名と違うアソシエーションでテーブル名を定義する
* モデルに便利メソッドを定義(messageの message_time)

# DIVE19_2 通知機能
point
* Websocket通知サービスPusherを利用する
* 利用開始までの流れはfbやtwitterでoauthを使ったところと似ている
* Pusher.triggerで発信
* jsのalertを使ってポップアップ
