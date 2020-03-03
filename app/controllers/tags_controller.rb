class TagsController < ApplicationController
  before_action :set_tag, only: [:update]

  def update_registration
    if @tag = Tag.find_by(code: params[:code])
      @tag.registered = true
      @tag.save
      redirect_to successful_registration_path
    else
      render template: 'pages/registration'
    end
  end

  def successful_registration
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:code, :category)
  end
end
