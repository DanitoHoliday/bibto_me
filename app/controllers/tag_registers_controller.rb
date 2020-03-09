class TagRegistersController < ApplicationController

  def update
    @tag = Tag.find_by(code: params[:code])
    if @tag.nil?
      flash.alert = "Code not found."
    elsif @tag.registered == false
      @tag.registered = true
      @tag.user = current_user
      @tag.save
      redirect_to register_success_path(@tag)
    elsif @tag.registered == true
      flash.alert = "Code is already registered."
    end
  end

  def successful_registration
    @tag = Tag.find_by(id: params[:format])
    @tag.registered = true
    @tag.user = current_user
    @tag.save
    @tag.category = params[:category]
  end

  def register_input
  end

end
