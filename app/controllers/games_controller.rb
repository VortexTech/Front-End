class GamesController < ApplicationController
  before_action :is_user

  def new
    @user = current_user
  end

  def create
    user = current_user
    response = GameFacade.create_game(params, user)
    # need to pass user so backend can add the game to the user, not sure how
    if response.status == 200
      flash[:success] = 'Game created successfully and added to your shelf!'
      redirect_to dashboard_path
    else
      # how do we deal with errors coming from the back end? This will need to change.
      flash.now[:error] = 'Please fill in all required fields.'
      render :new
    end
  end
end
