class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    # authorize @user
  end

  def update
    @user = User.first
  end
end
