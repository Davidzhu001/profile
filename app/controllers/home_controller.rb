class HomeController < ApplicationController
	layout 'home'
  def index
  	@tech_articles = Article.limit(3)
  end
end
