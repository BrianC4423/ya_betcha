require 'rails_helper'

feature 'user views bet details', %{
  As a user I want to view a bet's details.
  So that I can effectively understand
  What the bet is about
} do

  # Acceptance Criteria
  # [] I must be able to get to this page from the bets index
  # [] I must see the bet's title, terms, wager, other filled out fields
  # [] I must see comments if any have been submitted
  # [] I must be able to click 'add comment' to post a new review

  scenario "user views plan details on separate page" do
    bet = FactoryGirl.create(:bet)

    visit bets_path
    click_link(bet.title)

    expect(page).to have_content(bet.title)
  end
end
