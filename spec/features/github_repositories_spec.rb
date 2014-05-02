require 'spec_helper'

feature "User Repositories" do
  scenario "viewing a user's repositories" do
    visit '/'
    click_on "Find User's Repositories"

    fill_in 'Username', :with => 'jetaggart'
    click_on 'Search'

    expect(page).to have_content('light-haskell')
    expect(page).to have_content('emacs')
    expect(page).to have_content('exercism.io')
  end
end
