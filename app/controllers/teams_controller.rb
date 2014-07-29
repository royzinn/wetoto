class TeamsController < ApplicationController
  respond_to :html, :js

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.create(team_params)
    @teams = Team.all
    # if @team.save
    #   redirect_to teams_path, success: "New team was created"
    # else
    #   render 'new'
    # end
  end

  def update
    @team = Team.find(params[:id])
    @team.update_attributes(team_params)
    @teams = Team.all
  end

  def delete
    @team = Team.find(params[:team_id])
  end

  def destroy
    @teams = Team.all
    @team = Team.find(params[:id])
    @team.destroy
  end
  private

  def team_params
    params.require(:team).permit(:name, :country)
  end
end
