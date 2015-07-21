class CommentMailer < ApplicationMailer
  default from: 'bet@ya_betcha.com'
  def sender_comment(bet, comment)
    @bet = bet
    @comment = comment

    mail(
      to: bet.sender.email,
      subject: "New Comment added to #{bet.title}"
    )
  end

  def receiver_comment(bet, comment)
    @bet = bet
    @comment = comment

    mail(
      to: bet.sender.email,
      subject: "New Comment added to #{bet.title}"
    )
  end
end
