class User < ApplicationRecord

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_length_of :first_name, minimum: 1

  scope :sorted, -> { order(:last_name, :first_name) }

  def full_name
    [first_name, last_name].join(' ')
  end

  def last_name_first
    [last_name, first_name].join(', ')
  end

  def abbrev_name
    first_initial = first_name.chars.first + ". "
    [first_initial, last_name].join(' ')
  end

end
