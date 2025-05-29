class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre

  validate :publication_date_cannot_be_in_the_future

  private

  def publication_date_cannot_be_in_the_future
    if publication_date.present? && publication_date > Date.today
      errors.add(:publication_date, "ne peut pas etre dans le futur")
    end
  end
end
