class Category < ApplicationRecord
  has_many :posts

  CATEGORY_ATRIBUTES = [:name, :description]
end
