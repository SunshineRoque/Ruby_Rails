class CatFactsController < ApplicationController
  def index
    @cat_fact = CatFact.last
  end

  def create
    service = CatFactService.new
    service.fetch_cat_fact
    redirect_to cat_facts_path
  end
end
