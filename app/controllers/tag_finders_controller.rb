class TagFindersController < ApplicationController
before_action :authenticate_user!, except: [:new, :create, :thank_you, :finder_input]

  def new
    if params.include?(:code)
      @tag = Tag.find_by(code: params[:code])
      if @tag.nil?
        redirect_to finder_input_path
        flash.alert = "Code not found."
      end
    elsif params.include?(:format)
      @tag = Tag.find_by(id: params[:format])
      if @tag.nil?
        redirect_to finder_input_path
        flash.alert = "Code not found."
      end
    end
    @finder = Finder.new
  end

  def create
    @tag = Tag.find_by(id: params[:format])
    @finder = Finder.new(finder_params)
    @finder.tag = @tag
    @finder.save
    TwilioController.send_message(@tag.user.phone, @finder.message)
    # mail = FinderMailer.with(user: @finder.tag.user, finder: @finder, tag: @finder.tag).notification
    # mail.deliver_now
    redirect_to finder_thank_you_path(@tag)
  end

  def finder_input
  end

  def thank_you
    @tag = Tag.find_by(id: params[:format])

  end

  private

  def finder_params
    params.require(:finder).permit(:phone, :email, :message)
  end
end
