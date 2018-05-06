class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  mount_uploader :thumb_nail, ThumbnailUploader
  belongs_to :category

  def to_param
    "#{title}".parameterize
  end

  def should_generate_new_friendly_id?
    new_record?
  end

  def thumb_url
    thumb_nail.blank? ? Settings.default.post_thumb : thumb_nail
  end

  POST_ATRRIBUTES = [:title, :thumb_nail, :content, :category_id]
end
