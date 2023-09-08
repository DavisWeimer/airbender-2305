class Character
  attr_reader :name,
              :allies,
              :enemies,
              :affiliation
  def initialize(char_params)
    @name = char_params[:name]
    @allies = char_params[:allies]
    @enemies = char_params[:enemies]
    @affiliation = char_params[:affiliation]
  end
end