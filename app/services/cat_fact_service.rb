class CatFactService
  attr_reader :url

  def initialize
    @url = 'https://catfact.ninja/fact'
  end

  def fetch_cat_fact
    request = RestClient.get("#{url}")
    cat_fact_data = JSON.parse(request.body)
    cat_fact = CatFact.new(fact: cat_fact_data['fact'])
    cat_fact.save
  end
end