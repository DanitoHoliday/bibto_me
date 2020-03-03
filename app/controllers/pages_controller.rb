class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

<<<<<<< HEAD
  def registration
  end
=======
  def thank_you
  end

>>>>>>> master
end
