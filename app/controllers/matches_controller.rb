# app/controllers/matches_controller.rb
class MatchesController < ApplicationController
  before_action :set_match, only: %i[show edit update destroy]

  # GET /matches
  def index
    @matches = Match.all
  end

  # GET /matches/1
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
  end


def create
  @match = User.first.hosted_matches.build(match_params)  # Temporary fix
  if @match.save
    redirect_to @match, notice: "Match created successfully."
  else
    render :new
  end
end


  # GET /matches/1/edit
  def edit
  end

  # PATCH/PUT /matches/1
  def update
    if @match.update(match_params)
      redirect_to @match, notice: "Match updated successfully."
    else
      render :edit
    end
  end

  # DELETE /matches/1
  def destroy
    @match.destroy
    redirect_to matches_url, notice: "Match deleted successfully."
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:title, :description, :location, :date, :time, :max_players)
  end
end
