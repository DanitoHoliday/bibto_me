class TagsController < ApplicationController
  before_action :set_tag, only: [:edit, :update, :destroy]



  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:code, :category)
  end
end
