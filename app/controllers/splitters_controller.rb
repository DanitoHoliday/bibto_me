class SplittersController < ApplicationController

  def split_users
    uri = request.original_url
    scanned_code = URI(uri).path.split('/').last
    @tag = Tag.find_by(code: scanned_code)
    if @tag.nil?
      redirect_to root_path
      flash.alert = "Code not found or not registered yet."
    elsif @tag.registered == false
      redirect_to register_success_path(@tag)
    elsif @tag.registered == true
      redirect_to new_tag_finder_path(@tag)
    end
  end
end
