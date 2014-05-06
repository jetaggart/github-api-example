require "spec_helper"

feature "User interacting with issues" do
  def go_to_issues_list(repository_name)
    visit "/"
    click_on "Find User's Repositories"

    fill_in "Username", :with => "jetaggart"
    click_on "Search"

    click_on repository_name
  end

  scenario "listing the issues on a repository" do
    VCR.use_cassette "github/users/jetaggart/repositories/light-haskell/issues" do
      go_to_issues_list("light-haskell")

      expect(page).to have_content("Seems like nothing working...")
      expect(page).to have_content("Running server remotely")
    end
  end

  scenario "adding an issue to a repository" do
    VCR.use_cassette "github/users/jetaggart/repositories/github-api-example/issues" do
      go_to_issues_list("github-api-example")

      expect(page).to have_content("Create New Issue")

      title = "This is a new issue"

      fill_in "Title", :with => title
      click_on "Create Issue"

      expect(page).to have_content(title)
    end
  end
end