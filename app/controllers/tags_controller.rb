class TagsController < ApplicationController
  before_action :set_tag, only: [:update]

  def update_registration
    if @tag = Tag.find_by(code: params[:code])
      @tag.registered = true
      @tag.user = User.first #change to current user
      @tag.save
      redirect_to successful_registration_path
    else
      render template: 'pages/registration'
    end
  end

  def return_tag_verification
    @tag = Tag.find_by(code: params[:code])

    if @tag && @tag.registered == true
      redirect_to new_finder_path(tag: @tag)
    else
      if !@tag
        @error = "wrong tag code! Please insert a valid code."
        render  "pages/return_item", :locals => { :error => @error }
      elsif @tag.registered == false
        @error = "Tag containing this code hasn't been yet registered."
        render  "pages/return_item", :locals => { :error => @error }
      end
    end
  end

  def successful_registration
    @tag = User.first.tags.last #change to current user
    # if tag.category
    #   respond_to do |format|
    #     format.html { redirect_to successful_registration_path(@tag) }
    #     format.js  # <-- will render `app/views/reviews/create.js.erb`
    #   end
    # else
    #   respond_to do |format|
    #     format.html { render 'tags/successful_registration' }
    #     format.js  # <-- idem
    #   end
    # end
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:code, :category)
  end
end
