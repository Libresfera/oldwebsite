class Podcast < ActiveRecord::Base
  has_attached_file :thumbnail, styles: { small: '100x100#', original: '500x500' }, default_url: 'missing-:style.jpg'
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/
end
