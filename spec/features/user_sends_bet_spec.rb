require 'rails_helper'

feature 'user sends bet to another user', %{
  As a signed in user
  I want to make a bet with another registered user
  So I can document that the bet has taken place
} do
  # Acceptance Criteria
  #
  #
  #
  let (:user) { FactoryGirl.create(:user) }
  scenario 'authenticated user issues a bet to another user' do
    user1 = FactoryGirl.create(:user)
    wager = FactoryGirl.create(:wager)
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    click_link 'Send Bet'

    expect(page).to have_content 'Email'

    fill_in 'Email', with: user1.email
    fill_in 'Title', with: 'Race'
    fill_in 'Terms', with: 'It is contest to see who can run the fastest mile'
    select wager.name, from: 'Wager'
    fill_in 'Date', with: '12/31/15'

    click_button 'Submit Bet'

    expect(page).to have_content()
  end
end
