class TagRegistersController < ApplicationController
  before_action :authenticate_user!, except: [:register_input]

  def update
    @tag = Tag.find_by(code: params[:code])
    if @tag.nil?
      flash[:alert] = "Code not found."
    elsif @tag.registered == false
      @tag.registered = true
      @tag.user = current_user
      @tag.save
      redirect_to register_success_path
    elsif @tag.registered == true
      flash.alert = "Code is already registered."
    end
  end

  def register_input
    # raise
  end

  def update_category
    @tag = Tag.find_by(code: params[:code])

    if params.include?(:category_dropdown)
      @tag.update(category: params[:category_dropdown])
      redirect_to dashboard_path
      flash[:notice] = "Category #{params[:category_dropdown]} assigned"
    else
      @tag.update(category: params[:category])
      flash[:notice] = "Category #{params[:category]} assigned"
      redirect_to register_success_path
    end
  end

  def successful_registration
    @tag = current_user.tags.last
  end

end
