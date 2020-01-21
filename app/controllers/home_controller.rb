class HomeController < ApplicationController
  def top
    @games = Game.order(created_at: "DESC").limit(5)
  end

  def about
  end
end
