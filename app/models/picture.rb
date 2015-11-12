class Picture < ActiveRecord::Base

  has_attached_file :image, styles: { large: "750x750>", medium: "300x300>", thumb: "150x150#" }
  validates :image, attachment_presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 4.megabytes
  validates_attachment_file_name :image, matches: [/gif\Z/, /png\Z/, /jpe?g\Z/]

  belongs_to :product

end
