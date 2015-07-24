require 'rails_helper'

feature 'user can view and make bet from another users page', %{
  As a signed in user
  I want view another users page and issue a bet from it
  So I can make a bet
} do
  # Acceptance Criteria
  #

  let (:user) { FactoryGirl.create(:user) }
  let (:user1) { FactoryGirl.create(:user) }

  scenario 'authenticated user views their bet page' do
    bet = FactoryGirl.create(:bet, receiver: user1)
    wager = FactoryGirl.create(:wager)
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    click_link bet.title
    click_link user1.username

    fill_in 'Title', with: 'Race'
    fill_in 'Terms', with: 'It is contest to see who can run the fastest mile'
    select wager.name, from: 'Wager'
    fill_in 'Date', with: '12/31/15'

    click_button 'Submit Bet'
    expect(page).to have_content bet.title
    expect(page).to have_content ("Bet Submitted")
  end
end
