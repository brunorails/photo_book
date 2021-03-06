class Photo < ActiveRecord::Base
  has_attached_file :image, styles: { thumb: '270x408#' }

  belongs_to :category

  delegate :link, to: :category, allow_nil: true

  validates_attachment_content_type :image,
    content_type: %w(image/jpg image/jpeg image/png)
  validates :image, presence: true
end
