class TotoFormsController < ApplicationController
  def index
    @toto_forms = TotoForm.all
  end

  def new
    @toto_form = TotoForm.new
  end

  def show
    @toto_form = TotoForm.find(params[:id])
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
