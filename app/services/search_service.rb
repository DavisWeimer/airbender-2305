class SearchService
  def self.conn
    @conn ||= Faraday.new(url: "https://last-airbender-api.fly.dev/api/v1/")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.all_characters
    @all_characters ||= get_url("characters")
  end
end