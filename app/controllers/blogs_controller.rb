class BlogsController < ApplicationController
  before_action :authenticate_user!
	before_action :set_blog, only: [:edit, :update, :destroy, :show]
  def index
		@blogs = Blog.all.order(:created_at => 'desc')
    respond_to do |format|
      format.html
      format.js
    end
  end

  #show アクションを定義します。入力フォームと一覧を表示するためインスタンスを２つ生成します。
  def show
    @comment = @blog.comments.build
    @comments = @blog.comments
    Notification.find(params[:notification_id]).update(read: true) if params[:notification_id]
  end

	def new
    if params[:back]
		  @blog = Blog.new(blogs_params)
    else
      @blog = Blog.new
    end
	end

	def create
		@blog=Blog.new(blogs_params)
    @blog.user_id=current_user.id
		if @blog.save
      Rails.logger.info "[INFO] save true case in "
			redirect_to blogs_path, notice: "ブログを作成しました"
      NoticeMailer.sendmail_blog(@blog).deliver
      Rails.logger.info "[INFO] save true case out "
		else
			render 'new'
		end 
	end

	def edit
    Rails.logger.info "edit in"
		
    Rails.logger.info "edit out"
	end

	def update
		if @blog.update(blogs_params)
			redirect_to blogs_path, notice: "ブログを更新しました"
		else	
			render 'edit'
		end
	end 

	def destroy
		@blog.destroy
		redirect_to blogs_path, notice: "ブログを削除しました"
	end

  def confirm
    @blog=Blog.new(blogs_params)
    render :new if @blog.invalid?
  end

	private
	def blogs_params
		params.require(:blog).permit(:title, :content)
	end

	def set_blog
    Rails.logger.info 'set_blog callled !'
		@blog=Blog.find(params[:id])
	end 
end
