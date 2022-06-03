class Task < ApplicationRecord

  belongs_to :category, optional: true

  scope :complete, -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }
  scope :sorted, -> { order(:position) }
  scope :search, -> (kw) { where("LOWER(name) LIKE ?", "%#{kw.downcase}%")}

end
