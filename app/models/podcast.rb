class Podcast < ActiveRecord::Base
  has_attached_file :thumbnail, styles: { small: '100x100#', original: '500x500' }, default_url: 'missing-:style.jpg'
  has_attached_file :audio

  validates_attachment :thumbnail, content_type: { content_type: /\Aimage\/.*\Z/ }
  validates_attachment :audio, presence: true, content_type: { content_type: ['audio/mpeg', 'audio/mp3'] }
end
