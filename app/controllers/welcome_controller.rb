class WelcomeController < ApplicationController

  def index
    @articles = Article.all
    @articles = @articles.sort { |x, y| y.created_at <=> x.created_at }
  end
end
