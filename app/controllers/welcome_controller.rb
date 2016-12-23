class WelcomeController < ApplicationController
  include WelcomeHelper

  def index
    @articles = Article.all
    @articles = @articles.sort { |x, y| y.created_at <=> x.created_at }
  end
end
