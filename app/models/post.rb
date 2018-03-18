class Post < ApplicationRecord

  def thumb_url
    self.thumb_nail.nil? ? Settings.default.post_thumb : self.thumb_nail
  end
end
