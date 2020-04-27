class Tag < ApplicationRecord
  belongs_to :user, optional: true
  has_many :finders
  validates :code, presence: true, uniqueness: true
  after_create :set_registration, on: [ :create ]
  has_one_attached :qr
  after_create_commit :generate_image

  private

  # def generate_qr
  #   qrcode = RQRCode::QRCode.new("https://www.bibto.me/qr/#{self.code}")

  #   png = qrcode.as_png(
  #     bit_depth: 1,
  #     border_modules: 0,
  #     color_mode: ChunkyPNG::COLOR_GRAYSCALE,
  #     color: '#424C6A',
  #     file: nil,
  #     fill: 'white',
  #     module_px_size: 6,
  #     resize_exactly_to: false,
  #     resize_gte_to: true,
  #     size: 300
  #   )

  #   file = Tempfile.new(["qr-#{self.code}", ".png"])
  #   IO.binwrite(file, png.to_s)
  #   file.rewind
  #   file.close

  #   self.qr.attach(io: File.open(file), filename: "qr-#{self.code}.png")

  #   file.unlink
  # end

   def generate_image
    #@tag = Tag.new(code: SecureRandom.hex(3).downcase, registered: false)

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
                  \"data\":\"https://www.bibto.me/qr/#{self.code}\",
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

    self.save
  end

  def set_registration
    self.registered = false
  end
end
