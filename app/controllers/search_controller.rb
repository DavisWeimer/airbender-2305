class SearchController < ApplicationController
  def index
    @nation = nation_decoder(params[:nation])
    @characters = SearchFacade.get_25_characters(params[:nation])
    @character_count = SearchFacade.char_count(params[:nation])
  end

  private

  def nation_decoder(nation_params)
    nations = {
      "fire+nation" => "Fire Nation",
      "air+nomads" => "Air Nomads",
      "earth+kingdom" => "Earth Kingdom",
      "water+tribes" => "Water Tribes"
    }
    
    nations[nation_params] || nation_params
  end
end