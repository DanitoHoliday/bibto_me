class TagRegistersController < ApplicationController

  def update_registration
      @tag.user = current_user
      @tag.save
      #redirect to show path
  end

  def show
  end

end
