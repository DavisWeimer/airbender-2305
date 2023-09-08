class SearchFacade < ApplicationController
  def self.get_all_characters(nation)
    SearchService.all_characters(nation).map do |char_data|
      Character.new(char_data)
    end
  end

  def self.get_25_characters(nation)
    get_all_characters(nation).take(25)
  end

  def self.char_count(nation)
    get_all_characters(nation).length
  end
end