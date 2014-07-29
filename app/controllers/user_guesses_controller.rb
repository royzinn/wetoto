class UserGuessesController < ApplicationController

  def new
    @toto_form = TotoForm.last
    @user_guess = UserGuess.new
  end

  def create
    results = params[:match].values.flatten
    @user_guess = current_user.user_guesses.build(results: results, toto_form_id: params[:toto_form_id])
    if @user_guess.save
      redirect_to toto_forms_path, success: "New form was created successfully"
    else
      render :new
    end
  end

  private

  def user_guess_params
    params.require(:user_guess).permit(results: [])
  end
end
