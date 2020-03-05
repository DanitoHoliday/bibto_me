class TagsController < ApplicationController
before_action :authenticate_user!, only: [:update_registration]

  def update_registration(tag)
    if @tag.registered == true
      render template: #'/registration'
      flash.alert = "Code already registered."
    elsif @tag.registered == false
      @tag.registered = true
      @tag.user = current_user
      @tag.save
      render :successful_registration, locals: { tag: @tag }
    else
      render template: 'tags/registration'
      flash.alert = "Code not found."
    end
  end

  def return_tag_verification
    @tag = Tag.find_by(code: params[:code])

    if @tag && @tag.registered = true
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

  def scan_code
    uri = request.original_url
    scanned_code = URI(uri).path.split('/').last
    @tag = Tag.find_by(code: scanned_code)
    if @tag.registered == true
      return_tag_verification
    elsif @tag.registered == false
      update_registration(@tag)
    end
  end

  #need view?

  def update
    @tag = Tag.find(params[:id])
    @tag.category = params[:category]
    @tag.save
    flash[:notice] = "Category set"
    render :successful_registration
  end

  def registration
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:code, :category)
  end
end
