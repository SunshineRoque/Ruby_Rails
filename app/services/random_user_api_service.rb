class RandomUserApiService
  attr_reader :url

  def initialize
    @url = "https://randomuser.me/api/"
  end

  def fetch_random_user
    @response = RestClient.get url
    JSON.parse(@response)
  end
end