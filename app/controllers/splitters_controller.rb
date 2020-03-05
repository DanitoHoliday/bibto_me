class SplittersController < ApplicationController

  def split_users
    uri = request.original_url
    scanned_code = URI(uri).path.split('/').last
    @tag = Tag.find_by(code: scanned_code)
    if @tag.registered == true
      redirect_to register_input_path
    elsif @tag.registered == false
      redirect_to finder_input_path
    end
  end
end
