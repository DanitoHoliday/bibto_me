class Tag < ApplicationRecord
  belongs_to :user, optional: true
  has_many :finders
  validates :code, presence: true, uniqueness: true
  after_create :set_registration, on: [ :create ]
  has_one_attached :qr

  after_create_commit :generate_qr

  private

  def generate_qr
    qrcode = RQRCode::QRCode.new("https://www.bibto.me/qr/#{self.code}")

    # NOTE: showing with default options specified explicitly
    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: 'black',
      file: nil,
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 600
    )

    file = Tempfile.new(["qr-#{self.code}", ".png"])
    IO.binwrite(file, png.to_s)
    file.rewind
    file.close

    self.qr.attach(io: File.open(file), filename: "qr-#{self.code}.png")

    file.unlink
  end

  def set_registration
    self.registered = false
  end

end
