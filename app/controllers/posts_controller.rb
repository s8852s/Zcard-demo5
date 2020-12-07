class PostsController < ApplicationController
  def new
    @board = Board.find_by(id: params[:board_id])
    @post = Post.new
  end

  def create
    # @board = Board.find_by(id: params[:board_id])
    # @post = Post.new(params_post)
    # if @post.save
    #   redirect_to board_path(@board), notice: "成功發表文章"
    # else
    #   render :new
    # end
  end

  private
  def params_post
    params.require(:post).permit(:title, :content)
  end
end
