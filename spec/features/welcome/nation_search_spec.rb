require "rails_helper"

RSpec.describe "Avatar API", type: :feature do
  describe "#GET" do
    it "can select from a list of nations", :vcr do
      character_data = 
        {
          name: "Azula",
          allies: ["Ozai", "Zuko"],
          enemies: ["Iroh",
                    "Zuko",
                    "Kuei",
                    "Long Feng",
                    "Mai",
                    "Ty Lee",
                    "Ursa"],
          affiliation: "Fire Nation",
          photoUrl: "https://vignette.wikia.nocookie.net/avatar/images/1/12/Azula.png/revision/latest?cb=20140905084941"
        }
      visit root_path

      expect(page).to have_content("The Four Nations")

      select "Fire Nation", from: "nation"
      click_button "Search For Members"

      expect(current_path).to eq(search_path)
      expect(page).to have_content("Fire Nation")
      expect(page).to have_content("Nation Member Count: 97")

      if character_data[:photoUrl].present?
        expect(page).to have_css("img[src*='#{character_data[:photoUrl]}']")
      end
  
      expect(page).to have_content("Allies:")
      character_data[:allies].each do |ally|
        expect(page).to have_content(ally)
      end
  
      expect(page).to have_content("Enemies:")
      character_data[:enemies].each do |enemy|
        expect(page).to have_content(enemy)
      end
  
      expect(page).to have_content("Affiliations:")
      expect(page).to have_content(character_data[:affiliation])
    end
  end
end