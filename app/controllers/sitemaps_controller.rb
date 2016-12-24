class SitemapsController < ApplicationController

  def index
      @articles = Article.all
      respond_to do |format|
          format.xml { render layout: false }
      end
  end
end
