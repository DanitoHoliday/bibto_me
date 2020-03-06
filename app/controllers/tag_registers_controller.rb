class TagRegistersController < ApplicationController

  def update
      @tag.registered = true
      @tag.user = current_user
      @tag.save
      redirect_to register_success_path(@tag)
  end

  def successful_registration
  end

  def register_input
  end

end
