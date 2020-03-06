class TagRegistersController < ApplicationController

  def update
    @tag = Tag.find_by(code: params[:code])
    if @tag
      @tag.registered = true
      @tag.user = current_user
      @tag.save
      redirect_to register_success_path(@tag)
    else
      flash.alert = "Code not found"
    end
  end

  def successful_registration
    @tag = Tag.find_by(id: params[:format])
    @tag.category = params[:category]
  end

  def register_input
    # @tag = Tag.find_by(code: params[:code])
  end

end
