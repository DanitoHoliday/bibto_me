class SplittersController < ApplicationController

  def split_users
    @tag = Tag.find_by(code: params[:code.downcase])
    if @tag.nil?
      redirect_to root_path
      flash.alert = "Code not found or not registered yet."
    elsif @tag.registered == false
      redirect_to register_input_path(code: @tag.code)
    elsif @tag.registered == true
      redirect_to finder_input_path(code: @tag.code)
    end
  end
end
