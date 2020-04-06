class DashboardController < ApplicationController

  def show
    @sequence = 0;
    @user = current_user
    @tags = @user.tags.order(created_at: :desc)
  end
end
