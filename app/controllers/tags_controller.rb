class TagsController < ApplicationController


  def update_registration
    if @tag = Tag.find_by(code: params[:code])
      #commented out for js testing
      # if @tag.registered == false
        @tag.registered = true
        @tag.user = User.first #change to current user
        @tag.save
        redirect_to successful_registration_path
      # commented out for js testing
      # else
      #   render template: 'pages/registration'
      #   flash.alert = "Code already registered."
      # end
    else
      render template: 'pages/registration'
      flash.alert = "Code not found."
    end
  end

  def return_tag_verification
    @tag = Tag.find_by(code: params[:code])

    if @tag && @tag.registered == true
      redirect_to new_finder_path(tag: @tag)
    elsif @tag && @tag.registered == false
      # Display new popup message
    else
      # Please check code - popup
    end
  end

  def successful_registration
    @tag = User.first.tags.last #change to current user
    @user = User.first
  end

  def update
    @tag = User.first.tags.last
    @tag.category = params[:id]
    @tag.save
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:code, :category)
  end
end
