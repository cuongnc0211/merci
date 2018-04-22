class Post < ApplicationRecord
  mount_uploader :thumb_nail, ThumbnailUploader
  belongs_to :category

  def thumb_url
    thumb_nail.blank? ? Settings.default.post_thumb : thumb_nail
  end

  POST_ATRRIBUTES = [:title, :thumb_nail, :content, :category_id]
end
