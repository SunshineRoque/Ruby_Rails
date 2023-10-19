class Api::NewsController < ApplicationController
  def index
    news_service = NewsApiService.new
    @categories = news_service.fetch_categories
    @articles = news_service.fetch_articles(params.permit!.slice(:category))
    ipify_service = IpifyApiService.new
    @user_ip = ipify_service.fetch_user_ip
    ipinfo_service = IpinfoApiService.new(@user_ip)
    @user_ip_info = ipinfo_service.fetch_ip_info
  end
end