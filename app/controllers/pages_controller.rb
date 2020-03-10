class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

   def thank_you
  end

  def the_404
  end

  def the_500
  end

  def return_item
    @error = ""
  end

end
