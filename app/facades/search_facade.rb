class SearchFacade < ApplicationController
  def self.get_all_characters
    SearchService.all_characters.map do |char_data|
      Character.new(char_data)
    end
  end
end