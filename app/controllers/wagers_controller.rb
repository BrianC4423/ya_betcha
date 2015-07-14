class CategoriesController < ApplicationController
  def index
    @wagers = Wager.all
  end
end
