class HomeController < ApplicationController
	layout 'home'
  def index
  	@articles = Article.all
  end
end
