class TagFindersController < ApplicationController
before_action :authenticate_user!, except: [:new, :create, :thank_you]

   def new
    @tag = Tag.find(params[:tag])
    @finder = Finder.new
  end

  def create
    @tag = Tag.find(params[:finder][:tag].to_i)
    @finder = Finder.new(finder_params)
    @finder.tag = @tag
    @finder.save
    mail = FinderMailer.with(user: @finder.tag.user, finder: @finder, tag: @finder.tag).notification
    mail.deliver_now
    redirect_to finder_thank_you_path
  end

  def finder_input
  end

  def thank_you
    # @finder = Finder.find(params[:id])
  end

  private

  def finder_params
    params.require(:finder).permit(:phone, :email, :message)
  end
end
