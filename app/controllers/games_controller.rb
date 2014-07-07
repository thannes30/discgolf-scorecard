class GamesController < ApplicationController

  def index

  end

  def new
    @game = Game.new
  end

  def search
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      weather_info = Weather.location_lookup(params[:game][:zipcode])
      @game.temperature = weather_info[:temperature]
      @game.wind = weather_info[:wind]
      @game.weather = weather_info[:weather]
      @game.save
      redirect_to new_game_score_path(@game)
    else
      render "new"
    end
  end

  def show
    @games = Game.all
  end

  def destroy
    Game.delete(params[:id])
    redirect_to root_path
  end

  private

  def game_params
    params.require(:game).permit(:course, :temperature, :wind, :weather, :created_at, :updated_at)
  end

end
