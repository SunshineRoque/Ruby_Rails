class CatFactService
  attr_accessor :user
  attr_reader :url

  def initialize(user)
    @url = 'https://catfact.ninja/fact'
    @user = user
  end

  def fetch_cat_fact
    request = RestClient.get("#{url}")
    cat_fact_data = JSON.parse(request.body)
    cat_fact = CatFact.new(fact: cat_fact_data['fact'], user: user)
    cat_fact.save
  end
end
