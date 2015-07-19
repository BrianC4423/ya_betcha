class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @bet = Bet.find(params[:bet_id])
    @comment = Comment.new(comment_params)
    @comment.bet = @bet
    @comment.user = current_user
    if @comment.save
      flash[:success] = 'Comment has been Added.'
      redirect_to bet_path(@bet)
    else
      flash[:alert] = "#{@comment.errors.full_messages.join('. ')}"
      render 'bets/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @bet = @comment.bet
    if @comment.destroy
      flash[:success] = 'Comment deleted'
      redirect_to bet_path(@bet)
    else
      flash[:alert] = "#{@comment.errors.full_messages.join('. ')}"
      render 'bets/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
