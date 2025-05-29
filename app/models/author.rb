class Author < ApplicationRecord
  has_many :books
  belongs_to :country

  validate :birth_date_cannot_be_in_the_future

  private

  def birth_date_cannot_be_in_the_future
    if birth_date.present? && birth_date > Date.today
      errors.add(:birth_date, "ne peut pas etre dans le futur")
    end
  end
end
