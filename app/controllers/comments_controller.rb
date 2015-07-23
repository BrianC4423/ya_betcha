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
      flash[:notice] = 'Comment has been Added.'
      CommentMailer.sender_comment(@bet, @comment).deliver_later
      CommentMailer.receiver_comment(@bet, @comment).deliver_later
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
      flash[:notice] = 'Comment deleted'
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
