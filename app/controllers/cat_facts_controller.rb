class CatFactsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_cat_facts, only: :destroy

  def index
    @cat_facts = CatFact.all
    @cat_facts = current_user.cat_facts if params[:Owned_by_me] == '1'
  end

  def create
    @cat_fact = current_user.cat_facts
    service = CatFactService.new(current_user)
    service.fetch_cat_fact
    flash[:notice] = 'Cat Fact created successfully'
    redirect_to cat_facts_path
  end

  def destroy
    @cat_fact.destroy
    flash[:notice] = 'Cat Fact destroyed successfully'
    redirect_to cat_facts_path
  end

  private

  def set_cat_facts
    @cat_fact = CatFact.find(params[:id])
  end
end
