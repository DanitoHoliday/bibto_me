require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'open-uri'

class TagsController < ApplicationController
  before_action :authenticate_user!, only: [:update_registration]

  def create
    @tag = Tag.new(code: SecureRandom.hex(3).downcase, registered: false)

    url = URI("https://qrcode-monkey.p.rapidapi.com/qr/custom")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request["x-rapidapi-host"] = 'qrcode-monkey.p.rapidapi.com'
    request["x-rapidapi-key"] = ENV['RAPIDAPI_KEY']
    request["content-type"] = 'application/json'
    request["accept"] = 'application/json'

    request.body = "{
                  \"data\":\"https://www.bibto.me/qr/#{@tag.code}\",
                  \"config\":{
                  \"body\":\"round\",
                  \"eye\":\"frame13\",
                  \"eyeBall\":\"ball14\",
                  \"erf1\":[],
                  \"erf2\":[],
                  \"erf3\":[],
                  \"brf1\":[],
                  \"brf2\":[],
                  \"brf3\":[],
                  \"bodyColor\":\"#3F4C6A\",
                  \"bgColor\":\"#FFFFFF\",
                  \"eye1Color\":\"#3F4C6A\",
                  \"eye2Color\":\"#3F4C6A\",
                  \"eye3Color\":\"#3F4C6A\",
                  \"eyeBall1Color\":\"#3F4C6A\",
                  \"eyeBall2Color\":\"#3F4C6A\",
                  \"eyeBall3Color\":\"#3F4C6A\",
                  \"gradientColor1\":\"#3F4C6A\",
                  \"gradientColor2\":\"#3F4C6A\",
                  \"gradientType\":\"linear\",
                  \"gradientOnEyes\":false,
                  \"logo\":\"https://res.cloudinary.com/dyuwip9bs/image/upload/v1587555929/bibtome/qr/logo/Group_3_2_vbumpc.png\",
                  \"logoMode\":\"clean\"},
                  \"size\":300,
                  \"download\":true,
                  \"file\":\"png\"}"

    response = http.request(request)
    result = JSON.parse(response.body)
    result_hash = result["imageUrl"]
    imglink = "https:#{result_hash}"

    Cloudinary::Uploader.upload(imglink, :folder => "bibtome/qr/", :resource_type => "image", :public_id => "#{@tag.code}",
      :transformation => [
        {:width => 340, :height => 340, :crop => "crop"},
        {:radius => 10}])

    @tag.save
    # download = open(imglink)
    # file = Tempfile.new(["#{@tag.code}", ".png"])
    # IO.binwrite(file, download.to_s)
    # file.rewind
    # file.close
    # @tag.qr.attach(io: File.open(file), filename: "#{@tag.code}.png")
    # file.unlink
  end

  def update_registration(tag)
    if @tag.registered == true
      render template: #'/registration'
      flash.alert = "Code already registered."
    elsif @tag.registered == false
      @tag.registered = true
      @tag.user = current_user
      @tag.save
      render :successful_registration, locals: { tag: @tag }
    else
      render template: 'tags/registration'
      flash.alert = "Code not found."
    end
  end

  def return_tag_verification
    @tag = Tag.find_by(code: params[:code])

    if @tag && @tag.registered = true
      redirect_to new_finder_path(tag: @tag)
    else
      if !@tag
        @error = "Wrong tag code! Please insert a valid code."
        render  "pages/return_item", :locals => { :error => @error }
      elsif @tag.registered == false
        @error = "Tag containing this code hasn't been yet registered."
        render  "pages/return_item", :locals => { :error => @error }
      end
    end
  end

  def scan_code
    uri = request.original_url
    scanned_code = URI(uri).path.split('/').last
    @tag = Tag.find_by(code: scanned_code)
    if @tag.registered == true
      return_tag_verification
    elsif @tag.registered == false
      update_registration(@tag)
    end
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.category = params[:category]
    @tag.save
    flash[:notice] = "Category set"
    render :successful_registration
  end

  def registration
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:code, :category)
  end
end
