class HomeController < ApplicationController
	layout 'home'
  def index
  	@tech_articles = Article.all
  end
end
