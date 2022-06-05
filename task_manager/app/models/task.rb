class Task < ApplicationRecord

  belongs_to :category, optional: true

  validates_presence_of :name
  validates_length_of :name, maximum: 50
  validates_presence_of :position
  validates_numericality_of :position, greater_than: 0

  validate :description_has_no_prohibited_words

  scope :complete, -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }
  scope :sorted, -> { order(:position) }
  scope :search, -> (kw) { where("LOWER(name) LIKE ?", "%#{kw.downcase}%")}

  private

    def description_has_no_prohibited_words
      return unless description.present?
      prohibited_words = ['later', 'eventually', 'someday']
      prohibited_words.each do |word|
        if description.include?(word)
          errors.add(:description, "cannot contain prohibited word: #{word}")
        end
      end
    end

end
