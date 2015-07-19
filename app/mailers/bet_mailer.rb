class BetMailer < ApplicationMailer
  default from: 'bet@ya_betcha.com'
  def new_bet(bet)
  @bet = bet

  mail(
      to: bet.receiver.email,
      subject: "New Bet #{bet.title}"
    )
  end
end
