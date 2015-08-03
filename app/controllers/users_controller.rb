class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @sent_bets = Bet.where(sender: @user)
    @receive_bets = Bet.where(receiver: @user)
    @bet = Bet.new
  end
end
