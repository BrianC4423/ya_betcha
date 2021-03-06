class BetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @active_bets = Bet.accepted("true").page(params[:page])
    @pending_bets = Bet.accepted("false").page(params[:page])
  end

  def show
    @bet = Bet.find(params[:id])
    @comments = @bet.comments.page(params[:page])
    @comment = Comment.new
  end

  def new
    @bet = Bet.new
  end

  def create
    @bet = Bet.new(bet_params)
    @bet.sender = current_user
    # receiver = User.find_by_email(bet_email[:receiver_id])
    # if receiver.present?
    #   @bet.receiver_id = receiver.id
    # else
    #   flash[:alert] = 'Email is not registered user'
    # end
    if !@bet.set_receiver(bet_email[:receiver_id])
      flash[:alert] = 'Email is not registered user'
    end

    if @bet.save
      flash[:success] = 'Bet Submitted'
      BetMailer.new_bet(@bet).deliver_later
      redirect_to root_path
    else
      announce_errors(@bet)
      render :new
    end
  end

  def edit
    @bet = Bet.find(params[:id])
  end

  def update
    @bet = Bet.find(params[:id])
  end

  def accept
    @bet = Bet.find(params[:id])
    if current_user.id == @bet.receiver_id
      @bet.accepted = true
      @bet.save
      flash[:success] = "Bet has been accepted!"
      redirect_to bet_path(@bet)
    else
      flash[:alert] = "You are not an authorized user"
      render :show
    end
  end

  def decline
    @bet = Bet.find(params[:id])
    if current_user.id == @bet.receiver_id
      @bet.declined = true
      @bet.destroy!
      flash[:alert] = "Bet has been declined, and deleted!"
      redirect_to bets_path
    else
      flash[:alert] = "You are not an authorized user"
      render :show
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
    flash[:notice] = %(
      #{count} #{'error'.pluralize(count)}
      prohibited this plan from being saved:
      #{bet.errors.full_messages.join('. ')}
    )
  end
end
