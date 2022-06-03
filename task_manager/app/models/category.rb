class Category < ApplicationRecord

  has_many :tasks

  scope :sorted, -> { order(:name) }

end
