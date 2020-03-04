class TagsController < ApplicationController


  def update_registration
    if @tag = Tag.find_by(code: params[:code])
      #commented out for js testing
      # if @tag.registered == false
        @tag.registered = true
        @tag.user = User.first #change to current user
        @tag.save
        render :successful_registration, locals: { tag: @tag }
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
    else
      if !@tag
        @error = "Wrong tag code! Please insert a valid code."
        render  "pages/return_item", :locals => { :error => @error }
      elsif @tag.registered == false
        @error = "Tag containing this code hasn't been yet registered."
        render  "pages/return_item", :locals => { :error => @error }
      end
    end
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.category = params[:category]
    @tag.save
    flash[:notice] = "lalalala"
    render :successful_registration
  end
  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:code, :category)
  end
end
