class SearchController < ApplicationController
  def index
    @characters = SearchFacade.get_all_characters
  end
end