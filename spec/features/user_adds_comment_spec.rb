require 'rails_helper'

feature 'user writes comment on bet', %{
  As a user I want to add comment to bet
  So that I can add my 2 cents
  What the
} do

  # Acceptance Criteria
  # [] I must be logged in to submit a comment
  # [] The comment must display my username
  # [] The comment can be deleted by its originater

  let! (:user) { FactoryGirl.create(:user) }
  let! (:bet) { FactoryGirl.create(:bet, receiver: user) }
  let! (:user1) { FactoryGirl.create(:user) }

  scenario "User wants to add comment to bet." do
    ActionMailer::Base.deliveries.clear
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    visit bets_path

    click_link(bet.title)
    fill_in 'Comment', with: 'You are gonna lose BRAH!'
    click_button 'Add Comment'

    expect(page).to have_content("Comment has been Added")
    expect(page).to have_content(bet.title)
    expect(page).to have_content("Delete")
    expect(ActionMailer::Base.deliveries.count).to eq(2)
  end

  scenario "not signed in user tries to add comment." do
    visit bets_path

    click_link(bet.title)
    fill_in 'Comment', with: 'You are gonna lose BRAH!'
    click_button 'Add Comment'

    expect(page).to have_content("User can't be blank")
  end

  scenario "User deletes own comment." do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    visit bets_path

    click_link(bet.title)
    fill_in 'Comment', with: 'You are gonna lose BRAH!'
    click_button 'Add Comment'

    click_link 'Delete'

    expect(page).to have_content("Comment deleted")
  end
end
