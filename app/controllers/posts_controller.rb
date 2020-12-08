class PostsController < ApplicationController
  
  def show
    # @board = Board.find_by(id: params[:board_id])
    @post = Post.find_by(id: params[:id])
    # @post = @board.posts
  end
  def new
    @board = Board.find_by(id: params[:board_id])
    @post = Post.new
  end

  def create
    @board = Board.find_by(id: params[:board_id])
    @post = current_user.posts.new(params_post)
    @post.board = @board
    if @post.save
      redirect_to board_path(@board), notice: "成功發表文章"
    else
      render :new
    end
  end

  def edit 
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(params_post)
      redirect_to post_path(@post), notice: "編輯文章成功"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy if @post
      redirect_to post_path(@post), notice: "刪除文章成功"
  end

  private
  def params_post
    params.require(:post).permit(:title, :content)
  end
end
