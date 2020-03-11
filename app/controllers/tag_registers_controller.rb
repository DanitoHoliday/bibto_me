class TagRegistersController < ApplicationController
  before_action :authenticate_user!, except: [:register_input]

  def update
    @tag = Tag.find_by(code: params[:code])
    if @tag.nil?
      @error = "* Code not found"
      #flash[:alert] = "Code not found."
      render :register_input
    elsif @tag.registered == false
      @tag.registered = true
      @tag.user = current_user
      @tag.save
      redirect_to register_success_path(tag: @tag)
    elsif @tag.registered == true
      # flash.alert = "Code is already registered."
      @error = "* Code is already registered"
      render :register_input
    end
  end

  def register_input
  end

  def update_category
    @tag = Tag.find_by(code: params[:code])

    if params.include?(:category_dropdown)
      @tag.update(category: params[:category_dropdown])
      redirect_to dashboard_path
      flash[:notice] = "Category #{params[:category_dropdown]} assigned"
    else
      @tag.update(category: params[:category])
      redirect_to register_success_path(tag: @tag)
      flash[:notice] = "Category #{params[:category]} assigned"
    end
  end

  def successful_registration
    @tag = Tag.find(params[:tag])
  end

end
