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

    def titleize_name
      self.name = name.titleize
    end

    def set_default_position
			if position.blank? || position < 1
				max = Task.maximum(:position) || 0
				self.position = max + 1
			end
		end

    def log_create
      logger.debug("Task being created: #{name}")
    end

    def log_update
      logger.debug("Task being updated: #{name}")
    end

    def log_save
			# runs on both create & update
      logger.debug("Task was saved: #{name}")
    end

    def cleaning_reminder
			# This could be a placeholder for sending an email to an admin
      logger.debug("Remember to prune old tasks")
    end

end
