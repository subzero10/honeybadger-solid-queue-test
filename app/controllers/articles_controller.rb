class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    SayHelloJob.perform_later

    @article = Article.find(params[:id])
  end

end
