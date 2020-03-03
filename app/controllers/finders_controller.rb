class FindersController < ApplicationController

  def new
    @tag = Tag.find(params[:tag])
    @finder = Finder.new
  end

  def create
    @finder = Finder.new(finder_params)
    @finder.save
    redirect_to finder_thank_you_path
  end

  def thank_you
    # @finder = Finder.find(params[:id])
  end

  private

  def finder_params
    params.require(:finder).permit(:phone, :email, :message)
  end


end
