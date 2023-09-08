class SearchController < ApplicationController
  def index
    require 'pry'; binding.pry
    @nation = nation_decoder(params[:nation])
    @characters = SearchFacade.get_all_characters
  end

  private
  def nation_decoder(nation_params)
    nations = {
      "fire+nation" => "Fire Nation",
      "air+nomads" => "Air Nomads",
      "earth+kingdom" => "Earth Kingdom",
      "water+tribe" => "Water Tribe"
    }
    
    nations[nation_params] || nation_params
  end
end

# "fire+nation"
# "air+nomads"
# "earth+kingdoms"
# "water+tribes"