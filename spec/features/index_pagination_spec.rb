require 'rails_helper'

feature 'user sees paginated pages', %{
  As a user
  I want to only view 10 bets per page
  So that I do not have to scroll forever
  Or think this page is sub par
} do

  scenario 'user sees pagination when there are many bets' do
    FactoryGirl.create_list(:bet, Bet.default_per_page + 1)
    new_bet = FactoryGirl.create(:bet, title: 'I wanna win')

    visit root_path

    expect(page).to have_content('1 2 Next › Last »')
    expect(page).not_to have_content(new_bet.title)
  end

  scenario 'user does not see pagination when under 10 bets' do
    FactoryGirl.create_list(:bet, 3)

    visit root_path

    expect(page).not_to have_selector('nav.pagination')
  end
end
