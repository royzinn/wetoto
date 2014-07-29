class MatchesController < ApplicationController
  def show
    @match = Match.find(params[:id])
  end

  def create
    @toto_form = TotoForm.create(toto_form_params)
    if @toto_form.save
      redirect_to toto_forms_path, success: "New form was created successfully"
    else
      render :new
    end
  end

  private

  def toto_form_params
    params.require(:toto_form).permit(:round, :round_date, matches_attributes: [:id, :home_team_id, :visitor_team_id, :date_played, :_destroy])
  end
end
