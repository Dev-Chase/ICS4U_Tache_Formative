class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre

  validate :publication_date_cannot_be_in_the_future

  # Explicitly Listing Allowed Associations and Attributes for ActiveAdmin
  def self.ransackable_associations(auth_object = nil)
    ["author", "genre"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "publication_date", "author_id", "pages", "genre_id", "created_at", "updated_at"]
  end

  # Custom Validations
  private

  def publication_date_cannot_be_in_the_future
    if publication_date.present? && publication_date > Date.today
      errors.add(:publication_date, "ne peut pas etre dans le futur")
    end
  end
end
