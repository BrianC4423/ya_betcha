require 'rails_helper'

feature 'User likes and unlikes bet' do
  # Acceptance Criteria
  # [] I must be logged in to like
  # [] The total number of likes with increase and decrease
  #    by a like or unlike

  let! (:user) { FactoryGirl.create(:user) }
  let! (:bet) { FactoryGirl.create(:bet, receiver: user) }

  before :each do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit bets_path
    click_link(bet.title)
  end

  scenario 'bet gets a like' do
    expect(page).to have_content 'Sign Out'
    expect(bet.score).to eq 0

    click_link ''

    expect(bet.reload.score).to eq 1
  end

  scenario 'user unlikes there like' do
    expect(bet.score).to eq 0

    click_link ''

    expect(bet.reload.score).to ep 1

    click_link ''

    expect(bet.reload.score).to eq 0
  end
end
