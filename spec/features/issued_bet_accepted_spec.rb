require 'rails_helper'

feature 'user accepts bet', %{
  As a user that recieved a bet request I want to be able to accept or decline
  So that I can know the state of
  What the bet is(active/pending)
} do

  # Acceptance Criteria
  # [] I must be able to change the status of the bet
  # []

  let! (:user) { FactoryGirl.create(:user) }
  let! (:bet) { FactoryGirl.create(:bet, receiver_id: user.id) }
  let! (:user1) { FactoryGirl.create(:user) }

  scenario "only user who receives the bet can accept it." do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    visit bets_path

    click_link(bet.title)
    click_link 'Accept'

    expect(page).to have_content("**Bet is Accepted**")

  end

  scenario "only user is not authorized to accept." do
    visit new_user_session_path

    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password

    click_button 'Log in'
    visit bets_path

    click_link(bet.title)
    click_link 'Accept'

    expect(page).to have_content("not an authorized user")

  end
end
