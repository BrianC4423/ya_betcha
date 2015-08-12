class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    vote = Vote.find_or_create_by(user: current_user, bet_id: params[:bet_id])
    vote.value = params[:value]
  end
end
