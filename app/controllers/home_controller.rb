class HomeController < ApplicationController
	layout 'home'
  def index
  	@tech_articles = Article.limit(6).all
  end
end
