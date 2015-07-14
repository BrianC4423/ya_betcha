class BetsController < ApplicationController
  def index
    @bets = Bet.all
  end

  def new
    @bet = Bet.new
  end

  def show
    @bet = Bet.find(params[:id])  
  end

  def create
    @bet = Bet.new(bet_params)
    @bet.sender = current_user
    receiver = User.find_by_email(bet_email[:receiver_id])
    if receiver.present?
      @bet.receiver_id = receiver.id
    else
      flash[:error] = 'Email is not registered user'
    end

    if @bet.save
      flash[:success] = 'Bet Submitted'
      redirect_to root_path
    else
      announce_errors(@bet)
      render :new
    end
  end

  private

  def bet_params
    params.require(:bet).permit(
      :title,
      :body,
      :wager_id,
      :date
    )
  end

  def bet_email
    params.require(:bet).permit(:receiver_id)
  end

  def announce_errors(bet)
    count = bet.errors.count
    flash[:alert] = %(
      #{count} #{'error'.pluralize(count)}
      prohibited this plan from being saved:
      #{plan.errors.full_messages.join('. ')}
    )
  end
end
