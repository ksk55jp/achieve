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
