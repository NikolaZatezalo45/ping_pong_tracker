class MatchesController < ApplicationController
  before_action :set_match, only: [:show]

  def index
    @matches = Match.all
  end

  def new
    @match = Match.new
  end

  def create
    match_params[:player_1_score] > match_params[:player_2_score] ? @winner = match_params[:player_1_id] : @winner = match_params[:player_2_id] 
    @match = Match.new(match_params.merge(winner: Player.find(@winner)))
    respond_to do |format|
      if @match.save
        @player = Player.find(@winner)
        @player.score = @player.score+1    
        @player.save
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }    
      end
    end
  end

  def show
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:player_1_id, 
    :player_2_id, 
    :player_1_score,
    :player_2_score)
  end

end
