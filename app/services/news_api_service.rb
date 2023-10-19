class NewsApiService
  attr_reader :url, :api_key

  def initialize
    @api_key = 'a1cf85dab8f64dddbd3ab4e34bd68a2b'
    @url = 'https://newsapi.org/v2/top-headlines'
  end

  def fetch_articles(params = {})
    api_params = {
      'apiKey': api_key,
      country: 'ph'
    }

    response = RestClient.get url, params: api_params.merge(params)
    JSON.parse(response)['articles']
  end

  def fetch_categories
    %w[business entertainment general health science sports technology]
  end
end