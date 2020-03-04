class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def registration
  end

  def thank_you
  end

  def return_item
    @error = ""
  end

end
