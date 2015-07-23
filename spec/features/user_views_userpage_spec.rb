require 'rails_helper'

feature 'user can view all the bets they have made', %{
  As a signed in user
  I want to view all my bets
  So I can keep track of them
} do
  # Acceptance Criteria
  #
  #
  #

  let (:user) { FactoryGirl.create(:user) }
  let! (:bet) { FactoryGirl.create(:bet, receiver: user) }

  scenario 'authenticated user views their bet page' do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_link 'My Bets'
    expect(page).to have_content bet.title
    expect(page).to have_content user.username
  end
end
