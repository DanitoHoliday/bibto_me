class DashboardController < ApplicationController

  def show
    @user = current_user
    @tags = @user.tags.order(created_at: :desc)
  end
end
