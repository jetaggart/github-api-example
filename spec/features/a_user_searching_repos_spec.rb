require 'spec_helper'

feature "User Repositories" do
  scenario "viewing a user's repositories" do
    VCR.use_cassette 'github/users/jetaggart/repositories' do
      visit '/'
      click_on "Find User's Repositories"

      fill_in 'Username', :with => 'jetaggart'
      click_on 'Search'

      expect(page).to have_content('light-haskell')
      expect(page).to have_content('emacs')
      expect(page).to have_content('exercism.io')
    end
  end
  
  scenario "viewing multiple searches" do
    VCR.use_cassette 'github/users/multiple/repositories' do
      visit '/'
      click_on "Find User's Repositories"

      fill_in 'Username', :with => 'jetaggart'
      click_on 'Search'

      visit '/'
      click_on "Find User's Repositories"

      fill_in 'Username', :with => 'durhamka'
      click_on 'Search'

      visit "/"
      click_on "View past searches"

      expect(page).to have_content("jetaggart")
      expect(page).to have_content("durhamka")

      click_on "jetaggart"

      expect(page).to have_content('light-haskell')
      expect(page).to have_content('emacs')
      expect(page).to have_content('exercism.io')
    end
  end
end
