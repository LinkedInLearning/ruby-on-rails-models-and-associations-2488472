class Category < ApplicationRecord

  has_many :tasks

  validates_length_of :name, within: 2..50

  scope :sorted, -> { order(:name) }

end
