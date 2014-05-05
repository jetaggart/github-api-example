require "spec_helper"

feature "User interacting with issues" do
  scenario "listing the issues on a repository" do
    VCR.use_cassette "github/users/jetaggart/repositories/light-haskell/issues", :record => :all do
      visit "/"
      click_on "Find User's Repositories"

      fill_in "Username", :with => "jetaggart"
      click_on "Search"

      click_on "light-haskell"

      expect(page).to have_content("Seems like nothing working...")
      expect(page).to have_content("Running server remotely")
    end
  end
end