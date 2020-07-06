class TagFindersController < ApplicationController
before_action :authenticate_user!, except: [:new, :create, :thank_you, :finder_input]

   def new
      if params.include?(:code)
        @tag = Tag.find_by(code: params[:code.downcase])
        if @tag.nil? || @tag.user.nil?
          @error = "* Code not found"
          render :finder_input
        end
      elsif params.include?(:format)
        @tag = Tag.find_by(id: params[:format.downcase])
        if @tag.nil? || @tag.user.nil?
          @error = "* Code not found"
          render :finder_input
        end
      end
    @finder = Finder.new
  end

  def create
    @tag = Tag.find_by(id: params[:format])
    @finder = Finder.new(finder_params)
    @finder.tag = @tag
    if @finder.save
      full_message = "#{@tag.category} found: #{@finder.phone} / #{@finder.email} | #{@finder.message}"
      ########### ------------------
      TwilioController.send_message(@tag.user.phone, full_message)
      ########### ------------------
      UserMailer.tag_found(@tag, @finder, full_message).deliver_now
      redirect_to finder_thank_you_path(@tag)
    else
      render :new
    end

    # mail = FinderMailer.with(user: @finder.tag.user, finder: @finder, tag: @finder.tag).notification
    # mail.deliver_now

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
