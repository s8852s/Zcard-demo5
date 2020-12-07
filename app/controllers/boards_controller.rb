class BoardsController < ApplicationController
  
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find_by(id: params[:id])
    @post = Post.new
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(params_board)
    if @board.save
      redirect_to root_path, notice: "成功新增看板"
    else
      render :new
    end
  end

  def edit
    @board = Board.find_by(id: params[:id])
  end

  def update
    @board = Board.find_by(id: params[:id])
    if @board.update(params_board)
      redirect_to root_path, notice: "成功修改看板"
    else
      render :edit
    end
  end

  def destroy
    @board = Board.find_by(id: params[:id])
    @board.destroy if @board
    redirect_to root_path, notice: "成功刪除看板"
  end

  private
  def params_board
    params.require(:board).permit(:title)
  end

end
