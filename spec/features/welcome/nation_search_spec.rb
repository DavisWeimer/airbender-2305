require "rails_helper"

RSpec.describe "Avatar API", type: :feature do
  describe "#GET" do
    it "can select from a list of nations", :vcr do
      visit root_path

      expect(page).to have_content("The Four Nations")

      select "Fire Nation", from: "nation"
      click_button "Search For Members"

      expect(current_path).to eq(search_path)
      expect(page).to have_content("Fire Nation")
      save_and_open_page
    end
  end
end