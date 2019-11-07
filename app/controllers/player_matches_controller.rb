class PlayerMatchesController < ApplicationController
  before_action :set_player, only: [:index]
  def index
      @matches = Match.where("player_1_id = ? OR  player_2_id = ?" , @player, @player)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_player
    @player = Player.find(params[:format])
  end
end
