class Task < ApplicationRecord

  belongs_to :category, optional: true

  validates_presence_of :name
  validates_length_of :name, maximum: 50
  validates_presence_of :position
  validates_numericality_of :position, greater_than: 0

  scope :complete, -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }
  scope :sorted, -> { order(:position) }
  scope :search, -> (kw) { where("LOWER(name) LIKE ?", "%#{kw.downcase}%")}

end
