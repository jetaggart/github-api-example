require "spec_helper"

feature "User Repositories" do
  scenario "viewing a user's repositories" do
    VCR.use_cassette "github/users/psylinse/repositories" do
      visit "/"

      within("main") do
        fill_in "Username", :with => "psylinse"
        click_on "Search"
      end

      expect(page).to have_content("light-haskell")
      expect(page).to have_content("emacs")
      expect(page).to have_content("exercism.io")
    end
  end
  
  scenario "viewing multiple searches" do
    VCR.use_cassette "github/users/multiple/repositories", :record => :all do
      visit "/"

      within("main") do
        fill_in "Username", :with => "psylinse"
        click_on "Search"
      end

      visit "/"

      within("main") do
        fill_in "Username", :with => "durhamka"
        click_on "Search"
      end

      visit "/"
      click_on "Past Searches"

      expect(page).to have_content("psylinse")
      expect(page).to have_content("durhamka")

      click_on "psylinse"

      expect(page).to have_content("light-haskell")
      expect(page).to have_content("emacs")
      expect(page).to have_content("exercism.io")
    end
  end
end
