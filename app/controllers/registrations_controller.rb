# app/controllers/registrations_controller.rb
class RegistrationsController < ApplicationController
  before_action :set_match
  before_action :set_registration, only: %i[destroy]

  # POST /matches/:match_id/registrations
  def create
    @registration = @match.registrations.build(user: current_user)
    if @registration.save
      redirect_to @match, notice: "Successfully joined the match."
    else
      redirect_to @match, alert: "Failed to join the match."
    end
  end

  # DELETE /matches/:match_id/registrations/:id
  def destroy
    @registration.destroy
    redirect_to @match, notice: "You have left the match."
  end

  private

  def set_match
    @match = Match.find(params[:match_id])
  end

  def set_registration
    @registration = @match.registrations.find_by(user: current_user)
  end
end
