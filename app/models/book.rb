class Book < ApplicationRecord

  belongs_to :user
  attachment :plofile_image
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 100 }

end